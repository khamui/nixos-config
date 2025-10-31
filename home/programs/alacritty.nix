{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "${pkgs.zsh}/bin/zsh";
        args = ["-l"];
      };
    };

    home.file.".config/alacritty/alacritty.toml".source = ./dotfiles/.alacritty.toml;
  };
}
