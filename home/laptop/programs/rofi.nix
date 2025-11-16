# rofi.nix
{
  config,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-unwrapped;

    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      drun-display-format = "{name}";
      display-drun = "Applications";
      display-run = "Run";
      display-window = "Windows";
    };
  };

  # Remove the home.activation block and add this instead:
  xdg.configFile."autostart/rofi-keybinding.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Setup Rofi Keybinding
    Exec=${pkgs.xfce.xfconf}/bin/xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Alt>e" -n -t string -s "${config.programs.rofi.package}/bin/rofi -show drun"
    Terminal=false
    StartupNotify=false
    Hidden=false
  '';
}
