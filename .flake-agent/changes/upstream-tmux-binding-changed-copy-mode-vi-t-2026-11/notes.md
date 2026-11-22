# upstream-tmux-binding-changed-copy-mode-vi-t-2026-11

Upstream-only: the new lock alone changed this; the config and the agent's edits don't explain it.

Finding: tmux-binding-changed copy-mode-vi T: command-prompt -1 -p "(jump to backward)" { send-keys -X jump-to-backward -- "%%" } → command-prompt -1P -p "(jump to backward)" { send-keys -X jump-to-backward -- "%%" }
Run: agent/update-2026-11-22-2 (2026-11-22), inputs: alacritty-theme, home-manager, nixpkgs, nvf
