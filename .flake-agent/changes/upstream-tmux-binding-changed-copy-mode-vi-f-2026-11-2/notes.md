# upstream-tmux-binding-changed-copy-mode-vi-f-2026-11-2

Upstream-only: the new lock alone changed this; the config and the agent's edits don't explain it.

Finding: tmux-binding-changed copy-mode-vi f: command-prompt -1 -p "(jump forward)" { send-keys -X jump-forward -- "%%" } → command-prompt -1P -p "(jump forward)" { send-keys -X jump-forward -- "%%" }
Run: agent/update-2026-11-22-2 (2026-11-22), inputs: alacritty-theme, home-manager, nixpkgs, nvf
