if [[ -o login ]]; then
    source /etc/profile.d/vte-2.91.sh
fi

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

# Aliases
alias \
  ..="cd .." \
  ..="cd .." \
  ...="cd ../.." \
  ....="cd ../../.." \
  .....="cd ../../../.." \
  e="$EDITOR" \
  o="xdg-open" \
  h="history" \
  c='clear' \
  l='ls -al --color=auto' \
  ls='ls --color=auto' \
  la='ls -a --color=auto' \
  ll='ls -l --color=auto' \
  l.='ls -d .* --color=auto' \
  lS='ls -al --sort=size --color=auto' \
  lt='ls -al --sort=modified --color=auto' \
  cp="cp -iv" \
  mv="mv -iv" \
  rm="rm -vI" \
  mkdir="mkdir -pv" \
  grep="grep --color=auto" \
  egrep="grep -E --color=auto" \
  fgrep="grep -F --color=auto" \
  lsblk="lsblk -e7"

# Load zsh config files
for _file in .config/zsh/*.zsh; do
    source "$_file"
done
