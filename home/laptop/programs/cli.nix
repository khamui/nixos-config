# cli.nix
# Everyday command-line tools.
{...}: {
  programs.bat.enable = true; # cat with syntax highlighting
  programs.fd.enable = true; # faster find
  programs.jq.enable = true; # JSON processor

  # modern ls; shell aliases off so your own `ls` alias in .zshrc stays
  programs.eza = {
    enable = true;
    enableZshIntegration = false;
  };

  # fuzzy shell history on Ctrl+R; local only, no sync
  programs.atuin = {
    enable = true;
    flags = ["--disable-up-arrow"];
    settings = {
      auto_sync = false;
      update_check = false;
      style = "compact";
    };
  };

  my.tips = [
    {
      cmd = "bat <file>";
      hint = "cat with syntax highlighting and line numbers";
    }
    {
      cmd = "fd <pattern>";
      hint = "find files by name, respects .gitignore (fd -e nix: by extension)";
    }
    {
      cmd = "curl -s <url> | jq .";
      hint = "pretty-print JSON; jq .field picks a value";
    }
    {
      cmd = "eza --tree --git-ignore";
      hint = "directory tree without ignored files";
    }
    {
      cmd = "Ctrl+R";
      hint = "atuin: fuzzy search shell history (filter by directory with Ctrl+R again)";
    }
  ];
}
