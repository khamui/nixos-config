# git.nix
{...}: {
  programs.git = {
    enable = true;
    settings.user.name = "Kha Mui";
    settings.user.email = "52801593+khamui@users.noreply.github.com";
  };
}
