# git.nix
{...}: {
  programs.git = {
    enable = true;
    settings.user.name = "Kha Mui";
    settings.user.email = "khamui@me.com";
  };
}
