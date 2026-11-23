# tips.nix
# Every module can add hints for its tools with `my.tips = [{cmd = ...; hint = ...;}];`.
# They are collected into one file for `tip` (random hint, daily greeting,
# fzf/rofi cheatsheet on Super+/), so the hints always match what is installed.
{
  config,
  lib,
  pkgs,
  ...
}: let
  tipsFile = pkgs.writeText "tips.tsv" (lib.concatMapStrings (t: "${t.cmd}\t${t.hint}\n") config.my.tips);

  tip = pkgs.writeShellApplication {
    name = "tip";
    runtimeInputs = with pkgs; [coreutils gawk fzf xclip config.programs.rofi.package];
    text = "TIPS_FILE=${tipsFile}\n" + builtins.readFile ./scripts/tip.sh;
  };
in {
  options.my.tips = lib.mkOption {
    type = lib.types.listOf (lib.types.submodule {
      options = {
        cmd = lib.mkOption {type = lib.types.str;};
        hint = lib.mkOption {type = lib.types.str;};
      };
    });
    default = [];
    description = "Command hints shown by `tip`.";
  };

  config = {
    home.packages = [tip];

    # first shell of the day shows one tip
    programs.zsh.initContent = lib.mkOrder 1600 "tip --daily";

    # Super+/ opens the cheatsheet (same xfconf pattern as the rofi binding)
    xdg.configFile."autostart/tip-keybinding.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Setup tip cheatsheet keybinding
      Exec=${pkgs.xfconf}/bin/xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>slash" -n -t string -s "${tip}/bin/tip --rofi"
      Terminal=false
      StartupNotify=false
    '';

    my.tips = [
      {
        cmd = "tip --all";
        hint = "search every tip; enter copies the command (Super+/ does the same in rofi)";
      }
      {
        cmd = "nh os switch";
        hint = "rebuild and activate this NixOS config, with a diff of what changed";
      }
      {
        cmd = "nh search <name>";
        hint = "search nixpkgs for a package";
      }
    ];
  };
}
