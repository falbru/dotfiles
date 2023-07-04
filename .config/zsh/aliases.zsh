# Abbreviations
alias \
    dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' \
    ..="cd .." \
    e="$EDITOR" \
    o="xdg-open" \
    h="history"

# Add common arguments to commands by default
alias \
    cp="cp -iv" \
    mv="mv -iv" \
    rm="rm -vI" \
    mkdir="mkdir -pv" \
    grep="grep --color=auto" \
    egrep="egrep --color=auto" \
    fgrep="fgrep --color=auto"

# Replace commands with modern alternatives
alias \
    ls='exa' \
    la='exa -a' \
    ll='exa -al' \
    l.='exa -d .*' \
    cat='bat -pp'

# Git
function git_current_branch() {
    git rev-parse --abbrev-ref HEAD
}

function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}

alias \
    g='git' \
    ginit='git init' \
    gcl='git clone --recurse-submodules' \
    gst='git status' \
    ga='git add' \
    gaa='git add --all' \
    gc='git commit -v' \
    gc!='git commit -v --amend' \
    gl='git pull' \
    gp='git push' \
    gpf='git push --force-with-lease' \
    gpsup='git push --set-upstream origin $(git_current_branch)' \
    gb='git branch' \
    gco='git checkout' \
    gcm='git checkout $(git_main_branch)' \
    gcb='git checkout -b' \
    glg='git log --stat' \
    gd='git diff' \
    gdca='git diff --cached'
