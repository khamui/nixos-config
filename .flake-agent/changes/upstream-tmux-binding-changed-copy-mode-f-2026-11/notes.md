# upstream-tmux-binding-changed-copy-mode-f-2026-11

Upstream-only: the new lock alone changed this; the config and the agent's edits don't explain it.

Finding: tmux-binding-changed copy-mode F: command-prompt -1 -p "(jump backward)" { send-keys -X jump-backward -- "%%" } → command-prompt -1P -p "(jump backward)" { send-keys -X jump-backward -- "%%" }
Run: agent/update-2026-11-22-2 (2026-11-22), inputs: alacritty-theme, home-manager, nixpkgs, nvf
