# Updated 8.10.22 (manually, curl)
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias k='cd ~'
alias dt='cd ~/Desktop'

# command aliases
alias v='nvim'
alias ls='ls -alrt -G'
alias r='rm -rfv'
alias s=git_status
alias b='git branch'
alias a=git_add
alias co=git_checkout
alias hist='git log --oneline --graph --decorate --all'
alias soz='source ~/.zshrc'

# tmux aliases
alias :q='exit'
alias tmx='tmux'

# lazygit aliases
alias lg='lazygit'

# work aliases
alias wd='cd $ENV'

# amapet aliases
alias amas='lua ~/.config/kscripts/amapet_start.lua'
alias amac='lua ~/.config/kscripts/amapet_start_clean.lua'

# fzf searcher
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# bindkey '^[[A' fzf-history-widget
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
