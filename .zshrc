# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Setup pure prompt
fpath+=($HOME/.zsh/pure)

autoload -U promptinit; promptinit
prompt pure

zstyle :prompt:pure:prompt:success color green

# Auto/tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Use vi keys in tab completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Edit command line with editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Load external config files
source "$HOME/.config/zsh/functions.zsh"
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/tools.zsh"

# Load plugins
eval "$(zoxide init zsh)"
source "/usr/share/fzf/shell/key-bindings.zsh"
source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
