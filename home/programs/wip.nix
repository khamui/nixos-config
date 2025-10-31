{config, ...}: {
  # Use home-manager's zsh module
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # ... basic config

    # But source your existing complex config
    initExtra = builtins.readFile ./dotfiles/.zshrc;
  };

  # Use home-manager's tmux module
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./dotfiles/.tmux.conf;
  };

  home.file.".config/nvf".source = ./dotfiles/.config/nvim;
}
