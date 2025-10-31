{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "${pkgs.zsh}/bin/zsh";
        args = ["-l"];
      };
    };

    extraConfig = builtins.readFile ./dotfiles/.alacritty.toml;
  };
}
