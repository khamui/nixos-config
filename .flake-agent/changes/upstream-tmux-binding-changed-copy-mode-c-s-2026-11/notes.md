# upstream-tmux-binding-changed-copy-mode-c-s-2026-11

Upstream-only: the new lock alone changed this; the config and the agent's edits don't explain it.

Finding: tmux-binding-changed copy-mode C-s: command-prompt -i -I "#{pane_search_string}" -T search -p "(search down)" { send-keys -X search-forward-incremental -- "%%" } → command-prompt -Pi -I "#{pane_search_string}" -T search -p "(search down)" { send-keys -X search-forward-incremental -- "%%" }
Run: agent/update-2026-11-22-2 (2026-11-22), inputs: alacritty-theme, home-manager, nixpkgs, nvf
