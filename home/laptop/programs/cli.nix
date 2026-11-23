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
}
