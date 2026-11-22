# upstream-tmux-binding-changed-copy-mode-vi-6-2026-11

Upstream-only: the new lock alone changed this; the config and the agent's edits don't explain it.

Finding: tmux-binding-changed copy-mode-vi 6: command-prompt -N -I 6 -p (repeat) { send-keys -N "%%" } → command-prompt -NP -I 6 -p (repeat) { send-keys -N "%%" }
Run: agent/update-2026-11-22-2 (2026-11-22), inputs: alacritty-theme, home-manager, nixpkgs, nvf
