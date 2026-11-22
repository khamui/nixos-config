# upstream-tmux-binding-changed-prefix-.-2026-11

Upstream-only: the new lock alone changed this; the config and the agent's edits don't explain it.

Finding: tmux-binding-changed prefix .: command-prompt -T target { move-window -t "%%" } → command-prompt { move-window -t "%%" }
Run: agent/update-2026-11-22-2 (2026-11-22), inputs: alacritty-theme, home-manager, nixpkgs, nvf
