# upstream-tmux-binding-changed-copy-mode-vi-2026-11-3

Upstream-only: the new lock alone changed this; the config and the agent's edits don't explain it.

Finding: tmux-binding-changed copy-mode-vi ?: command-prompt -T search -p "(search up)" { send-keys -X search-backward -- "%%" } → command-prompt -P -T search -p "(search up)" { send-keys -X search-backward -- "%%" }
Run: agent/update-2026-11-22-2 (2026-11-22), inputs: alacritty-theme, home-manager, nixpkgs, nvf
