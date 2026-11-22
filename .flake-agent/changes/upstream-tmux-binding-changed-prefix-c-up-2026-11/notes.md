# upstream-tmux-binding-changed-prefix-c-up-2026-11

Upstream-only: the new lock alone changed this; the config and the agent's edits don't explain it.

Finding: tmux-binding-changed prefix C-Up: -r resize-pane -U → -r if-shell -F "#{?floating_pane_flag}" { resize-pane -D -1 } { resize-pane -U -- }
Run: agent/update-2026-11-22-2 (2026-11-22), inputs: alacritty-theme, home-manager, nixpkgs, nvf
