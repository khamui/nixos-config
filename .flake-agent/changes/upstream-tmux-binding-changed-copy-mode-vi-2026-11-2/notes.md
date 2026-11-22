# upstream-tmux-binding-changed-copy-mode-vi-2026-11-2

Upstream-only: the new lock alone changed this; the config and the agent's edits don't explain it.

Finding: tmux-binding-changed copy-mode-vi :: command-prompt -p "(goto line)" { send-keys -X goto-line -- "%%" } → command-prompt -P -p "(goto line)" { send-keys -X goto-line -- "%%" }
Run: agent/update-2026-11-22-2 (2026-11-22), inputs: alacritty-theme, home-manager, nixpkgs, nvf
