{...}: {
  # Use home-manager's zsh module
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # ... basic config

    # But source your existing complex config
    initExtra = builtins.readFile ~/nixos-dotfiles/.zshrc;
  };

  # Use home-manager's tmux module
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ~/nixos-dotfiles/tmux.conf;
  };

  # Symlink nvim config entirely
  home.file.".config/nvim".source = ~/nixos-dotfiles/nvim;
}
