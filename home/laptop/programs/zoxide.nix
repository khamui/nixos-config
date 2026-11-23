{...}: {
  programs.zoxide.enable = true;

  my.tips = [
    {
      cmd = "z <part of path>";
      hint = "jump to a frequently used directory";
    }
    {
      cmd = "zi";
      hint = "pick a directory with fzf";
    }
  ];
}
