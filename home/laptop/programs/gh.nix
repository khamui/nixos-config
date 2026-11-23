# gh.nix
# GitHub CLI config (login stays in the untracked ~/.config/gh/hosts.yml)
# plus gh-dash: a PR/issue dashboard, run with `gh dash`.
{...}: {
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https";
      aliases.co = "pr checkout";
    };
  };

  programs.gh-dash.enable = true;

  my.tips = [
    {
      cmd = "gh dash";
      hint = "dashboard of your PRs and issues";
    }
    {
      cmd = "gh co <number>";
      hint = "check out a pull request locally";
    }
  ];
}
