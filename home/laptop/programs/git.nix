# git.nix
{...}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Kha Mui";
      init.defaultBranch = "main";
      safe.directory = "/home/khamui/Repos/nixos-config";
      alias.mergetool = "!nvim -c DiffviewOpen";
    };
    # user.email lives in an untracked local file (kept out of this public repo)
    includes = [{path = "~/.config/git/local";}];
  };
}
