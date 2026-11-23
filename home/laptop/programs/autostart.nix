# autostart.nix
# At login: a terminal (which opens tmux, see alacritty.toml) and Chrome on workspace 2.
{
  config,
  pkgs,
  ...
}: let
  devSession = pkgs.writeShellApplication {
    name = "dev-session";
    runtimeInputs = with pkgs; [coreutils gawk wmctrl xorg.xprop];
    text = ''
      ${config.programs.alacritty.package}/bin/alacritty &
      ${pkgs.google-chrome}/bin/google-chrome-stable &

      # resize the terminal to fill the work area (panel excluded), leaving a gutter
      gutter=16
      for _ in $(seq 60); do
        term=$(wmctrl -lx | awk '$3 ~ /Alacritty/ { print $1; exit }')
        if [ -n "$term" ]; then
          # current desktop's work area: "WA: x,y wxh"
          read -r wx wy ww wh < <(wmctrl -d | awk '$2 == "*" {
            for (i = 1; i <= NF; i++) if ($i == "WA:") { split($(i+1), p, ","); split($(i+2), s, "x"); print p[1], p[2], s[1], s[2] }
          }')
          # decoration sizes: left, right, top, bottom (may not be set right away)
          read -r fl fr ft fb < <(xprop -id "$term" _NET_FRAME_EXTENTS | awk -F'= ' '{ gsub(",", ""); print $2 }')
          fl=''${fl:-0} fr=''${fr:-0} ft=''${ft:-0} fb=''${fb:-0}
          wmctrl -i -r "$term" -b remove,maximized_vert,maximized_horz
          # gravity 10 (static): x/y are the client area's position, so offset by the decorations
          wmctrl -i -r "$term" -e "10,$((wx + gutter + fl)),$((wy + gutter + ft)),$((ww - 2 * gutter - fl - fr)),$((wh - 2 * gutter - ft - fb))"
          break
        fi
        sleep 0.25
      done

      # move Chrome's windows to workspace 2 once they appear (up to ~15 s)
      for _ in $(seq 60); do
        wins=$(wmctrl -lx | awk '$3 ~ /google-chrome/ { print $1 }')
        if [ -n "$wins" ]; then
          for w in $wins; do wmctrl -i -r "$w" -t 1; done
          break
        fi
        sleep 0.25
      done
    '';
  };
in {
  xdg.configFile."autostart/dev-session.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Dev session (terminal + Chrome)
    Exec=${devSession}/bin/dev-session
    Terminal=false
    StartupNotify=false
  '';
}
