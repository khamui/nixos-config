{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    extraConfig = ''
      # color
      # set -g status-style bg=default

      # set mouse
      setw -g mouse on

      # set zsh as shell
      set -g default-command ${pkgs.zsh}/bin/zsh

      # making vi mode available (copy mode)
      setw -g mode-keys vi
      bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "${pkgs.xclip}/bin/xclip -i -selection clipboard"
      bind -T copy-mode-vi y send-keys -X copy-pipe "${pkgs.xclip}/bin/xclip -i -selection clipboard"

      #set-option -g xterm-keys on

      # remap prefix binding
      unbind C-b
      set-option -g prefix C-n
      bind-key C-n send-prefix

      # remap split bindings
      bind M-l split-window -h
      bind M-j split-window -v
      unbind '"'
      unbind %

      # reload config file (change file location to your the tmux.conf you want to use)
      bind r source-file ~/.tmux.conf

      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
        | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?\\.?g?(view|l?n?vim?x?|fzf)(diff)?(-wrapped)?$'"

      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
      bind-key -n 'C-\' if-shell "$is_vim" 'send-keys C-\\'  'select-pane -l'

      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R

      # setting escape time
      set-option -sg escape-time 10

      # setting focus-events
      set-option -g focus-events on

      # color settings
      set -g default-terminal "xterm-256color"
      set -g status-style bg=#1a1b26,fg=#c0caf5
      set -g window-status-current-style bg=#3b4261,fg=#7aa2f7,bold
      set -g window-status-style bg=#1a1b26,fg=#565f89
      set -g pane-border-style fg=#3b4261
      set -g pane-active-border-style fg=#7aa2f7
      set -g message-style bg=#1a1b26,fg=#7aa2f7
    '';
  };
}
