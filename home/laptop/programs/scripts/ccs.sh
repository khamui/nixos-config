# ccs: recent Claude Code sessions across all projects, newest first.
#   ccs              pick one in fzf; enter resumes it (new tmux window in its directory)
#   ccs --list [n]   print the n most recent sessions
#   ccs --daily      like --list 3, but only on the first call of the day
projects="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/projects"
limit="${CCS_LIMIT:-50}"

age() {
  local s=$(($(date +%s) - ${1%.*}))
  if ((s < 3600)); then echo "$((s / 60))m"
  elif ((s < 86400)); then echo "$((s / 3600))h"
  else echo "$((s / 86400))d"; fi
}

# session file -> "id<TAB>cwd<TAB>title<TAB>branch"; nothing if it has no title or prompt yet
meta() {
  {
    grep -m1 -E '"cwd":' "$1" || true
    grep -E '"type": ?"(custom-title|agent-name|ai-title|last-prompt)"' "$1" || true
  } | jq -rs --arg id "$(basename "$1" .jsonl)" '
      (map(.cwd // empty) | first) as $cwd
      | (map(.gitBranch // empty) | first // "") as $branch
      | ((map(select(.type == "custom-title") | .customTitle) | last)
         // (map(select(.type == "agent-name") | .agentName) | last)
         // (map(select(.type == "ai-title") | .aiTitle) | last)
         // (map(select(.type == "last-prompt") | .lastPrompt) | last)) as $title
      | select($cwd != null and $title != null)
      | [$id, $cwd, ($title | gsub("[\t\n]+"; " ")), $branch] | @tsv' 2>/dev/null || true
}

# "id<TAB>cwd<TAB>display line", sessions whose directory still exists
list() {
  find "$projects" -mindepth 2 -maxdepth 2 -name '*.jsonl' -printf '%T@\t%p\n' |
    sort -rn | sed -n "1,${1}p" |
    while IFS=$'\t' read -r mtime file; do
      IFS=$'\t' read -r id cwd title branch < <(meta "$file") || continue
      [ -d "$cwd" ] || continue
      printf '%s\t%s\t%-4s %-16.16s %s%s\n' "$id" "$cwd" "$(age "$mtime")" \
        "$(basename "$cwd")" "$title" "${branch:+  [$branch]}"
    done
}

preview() {
  local file
  file=$(find "$projects" -mindepth 2 -maxdepth 2 -name "$1.jsonl" -print -quit)
  printf '%s\n\nrecent prompts:\n' "$2"
  grep -E '"type": ?"user"' "$file" | jq -r '
      select((.isMeta | not) and (.message.content | type) == "string"
             and (.message.content | startswith("<") | not))
      | "› " + (.message.content | gsub("\\s+"; " ") | .[0:240])' 2>/dev/null | tail -n 8 || true
}

# open: directory, window name, command typed into the new shell (may be empty)
open() {
  if [ -n "${TMUX:-}" ]; then
    local pane
    pane=$(tmux new-window -P -F '#{pane_id}' -c "$1" -n "$2")
    # typed into zsh, so direnv loads the project's devShell before the command runs
    [ -z "$3" ] || tmux send-keys -t "$pane" "$3" Enter
  else
    cd "$1"
    if [ -n "$3" ]; then exec zsh -ic "$3; exec zsh"; else exec zsh; fi
  fi
}

case "${1:-}" in
  --preview)
    preview "$2" "$3"
    exit
    ;;
  --list)
    n="${2:-5}"
    list $((n * 3)) | cut -f3 | sed -n "1,${n}p"
    exit
    ;;
  --daily)
    stamp="${XDG_STATE_HOME:-$HOME/.local/state}/ccs-daily"
    [ "$(cat "$stamp" 2>/dev/null)" != "$(date +%F)" ] || exit 0
    mkdir -p "$(dirname "$stamp")" && date +%F >"$stamp"
    echo "recent Claude sessions (ccs, or tmux prefix + S, to resume):"
    list 9 | cut -f3 | sed -n '1,3p' | sed 's/^/  /'
    exit
    ;;
esac

out=$(list "$limit" | fzf --delimiter='\t' --with-nth=3 --no-sort --layout=reverse \
  --prompt='claude sessions> ' --expect=ctrl-n,ctrl-o \
  --header='enter: resume · ctrl-n: new session there · ctrl-o: shell there' \
  --preview="$0 --preview {1} {2}" --preview-window=down,40%,wrap) || exit 0

key=$(sed -n 1p <<<"$out")
line=$(sed -n 2p <<<"$out")
id=$(cut -f1 <<<"$line")
cwd=$(cut -f2 <<<"$line")

case "$key" in
  ctrl-n) open "$cwd" "$(basename "$cwd")" "claude" ;;
  ctrl-o) open "$cwd" "$(basename "$cwd")" "" ;;
  *) open "$cwd" "$(basename "$cwd")" "claude --resume $id" ;;
esac
