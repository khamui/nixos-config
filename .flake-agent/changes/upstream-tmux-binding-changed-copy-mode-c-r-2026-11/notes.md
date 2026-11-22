# upstream-tmux-binding-changed-copy-mode-c-r-2026-11

Upstream-only: the new lock alone changed this; the config and the agent's edits don't explain it.

Finding: tmux-binding-changed copy-mode C-r: command-prompt -i -I "#{pane_search_string}" -T search -p "(search up)" { send-keys -X search-backward-incremental -- "%%" } → command-prompt -Pi -I "#{pane_search_string}" -T search -p "(search up)" { send-keys -X search-backward-incremental -- "%%" }
Run: agent/update-2026-11-22-2 (2026-11-22), inputs: alacritty-theme, home-manager, nixpkgs, nvf
