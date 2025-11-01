{config, ...}: {
  # Use home-manager's zsh module
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # ... basic config

    # But source your existing complex config
    initExtra = builtins.readFile ./dotfiles/.zshrc;
  };
}
