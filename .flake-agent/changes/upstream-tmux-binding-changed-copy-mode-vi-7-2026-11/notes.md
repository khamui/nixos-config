# upstream-tmux-binding-changed-copy-mode-vi-7-2026-11

Upstream-only: the new lock alone changed this; the config and the agent's edits don't explain it.

Finding: tmux-binding-changed copy-mode-vi 7: command-prompt -N -I 7 -p (repeat) { send-keys -N "%%" } → command-prompt -NP -I 7 -p (repeat) { send-keys -N "%%" }
Run: agent/update-2026-11-22-2 (2026-11-22), inputs: alacritty-theme, home-manager, nixpkgs, nvf
