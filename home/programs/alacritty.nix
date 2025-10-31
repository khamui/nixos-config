{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = {
        program = "/bin/zsh";
      };

      window = {
        title = "Alacritty (zsh)";
        dimensions = {
          columns = 120;
          lines = 40;
        };
        padding = {
          x = 8;
          y = 8;
        };
      };
    };
  };
}
