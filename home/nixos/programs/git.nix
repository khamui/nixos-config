# git.nix
{...}: {
  programs.git = {
    enable = true;
    userName = "Kha Mui";
    userEmail = "khamui@me.com";
  };
}
