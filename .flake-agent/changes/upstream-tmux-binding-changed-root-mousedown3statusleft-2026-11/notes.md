# upstream-tmux-binding-changed-root-mousedown3statusleft-2026-11

Upstream-only: the new lock alone changed this; the config and the agent's edits don't explain it.

Finding: tmux-binding-changed root MouseDown3StatusLeft: display-menu -T "#[align=centre]#{session_name}" -t = -x M -y W Next n { switch-client -n } Previous p { switch-client -p } '' Renumber N { move-window -r } Rename r { command-prompt -I "#S" { rename-session "%%" } } Detach d { detach-client } '' "New Session" s { new-session } "New Window" w { new-window } → run-shell -C "display-menu -t= -xM -yW -T '#[align=centre]#{session_name}'  #{S/t:#{?#{&&:#{<:#{loop_index},6},#{!:#{session_active}}},'Switch To #[underscore]#{session_name}' '' {switch-client -t=#{session_id}#} ,}} '' 'Renumber' 'N' {move-window -r} 'Rename' 'r' {command-prompt -I '#S' {rename-session -- '%%'}} 'Detach' 'd' {detach-client} '' 'New Session' 's' {new-session} 'New Window' 'w' {new-window}"
Run: agent/update-2026-11-22-2 (2026-11-22), inputs: alacritty-theme, home-manager, nixpkgs, nvf
