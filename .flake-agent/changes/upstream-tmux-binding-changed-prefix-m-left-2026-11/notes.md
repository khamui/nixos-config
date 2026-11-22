# upstream-tmux-binding-changed-prefix-m-left-2026-11

Upstream-only: the new lock alone changed this; the config and the agent's edits don't explain it.

Finding: tmux-binding-changed prefix M-Left: -r resize-pane -L 5 → -r if-shell -F "#{?floating_pane_flag}" { resize-pane -R -5 } { resize-pane -L 5 }
Run: agent/update-2026-11-22-2 (2026-11-22), inputs: alacritty-theme, home-manager, nixpkgs, nvf
