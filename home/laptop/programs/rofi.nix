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

  # For XFCE, configure the keybinding via xfconf
  home.activation.xfceRofiKeybinding = config.lib.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD ${pkgs.xfce.xfconf}/bin/xfconf-query -c xfce4-keyboard-shortcuts \
      -p "/commands/custom/<Alt>e" \
      -n -t string \
      -s "${config.programs.rofi.package}/bin/rofi -show drun" || \
    $DRY_RUN_CMD ${pkgs.xfce.xfconf}/bin/xfconf-query -c xfce4-keyboard-shortcuts \
      -p "/commands/custom/<Alt>e" \
      -s "${config.programs.rofi.package}/bin/rofi -show drun"
  '';
}
