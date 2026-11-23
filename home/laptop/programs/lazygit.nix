{...}: {
  programs.lazygit.enable = true;

  my.tips = [
    {
      cmd = "lg";
      hint = "lazygit; on quit your shell cds to the repo you ended in";
    }
  ];
}
