# Abbreviations
alias \
    dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' \
    ..="cd .." \
    e="$EDITOR" \
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
alias \
    g='git' \
    ginit='git init' \
    gcl='git clone --recurse-submodules' \
    gst='git status' \
    ga='git add' \
    gaa='git add --all' \
    gc='git commit -v' \
    gl='git pull' \
    gp='git push' \
    gpsup='git push --set-upstream origin' \
    gco='git checkout' \
    gcm='git checkout master' \
    gcb='git checkout -b' \
    glg='git log --stat' \
    gd='git diff'
