# Abbreviations
alias \
    ..="cd .." \
    ..="cd .." \
    ...="cd ../.." \
    ....="cd ../../.." \
    .....="cd ../../../.." \
    e="$EDITOR" \
    k="kak-qt" \
    o="xdg-open" \
    h="history" \
    c='clear' \
    l='eza -al' \
    ls='eza' \
    la='eza -a' \
    ll='eza -l' \
    l.='eza -d .*' \
    lS='eza -al --sort=size' \
    lt='eza -al --sort=modified' \
    fd="fdfind" \
    bat="batcat" \
    p='ghq_fzf_cd' \
    pnew='ghq_create_and_cd' \
    pget='ghq_get_and_cd' \
    itpass='PASSWORD_STORE_DIR=/home/falk/ghq/github.com/itdagene-ntnu/password-store pass' \
    aptfi='apt_fuzzy_install' \
    aptrm='sudo apt remove' \
    aptupg='sudo apt update && sudo apt upgrade && sudo apt autoremove'

# Add common arguments to commands by default
alias \
    cp="cp -iv" \
    mv="mv -iv" \
    rm="rm -vI" \
    mkdir="mkdir -pv" \
    grep="grep --color=auto" \
    egrep="grep -E --color=auto" \
    fgrep="grep -F --color=auto" \
    lsblk="lsblk -e7"

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

function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel develop development; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return 0
    fi
  done

  echo develop
  return 1
}

alias \
    g='git' \
    ginit='git init' \
    gcl='git clone --recurse-submodules' \
    gst='git status' \
    ga='git add' \
    gaa='git add --all' \
    grs='git restore' \
    grst='git restore --staged' \
    gc='git commit -S -v' \
    gc!='git commit -S -v --amend' \
    gl='git pull' \
    gp='git push' \
    gpf='git push --force-with-lease' \
    gpsup='git push --set-upstream origin $(git_current_branch)' \
    gb='git branch' \
    gco='git checkout' \
    gcm='git checkout $(git_main_branch)' \
    gcd='git checkout $(git_develop_branch)' \
    gcb='git checkout -b' \
    grl='git reflog' \
    glg='git log --stat' \
    gd='git diff' \
    gdca='git diff --cached' \
    gdm='git diff $(git_main_branch)..' \
    gdd='git diff $(git_develop_branch)..' \
    grb='git rebase' \
    grbi='git rebase -i' \
    grbm='git rebase $(git_main_branch)' \
    grbd='git rebase $(git_develop_branch)' \
    grba='git rebase --abort' \
    grbc='git rebase --continue' \
    gm='git merge' \
    gma='git merge --abort' \
    gsta='git stash push' \
    gstaa='git stash apply' \
    gclean='git clean -id' \
    grh='git reset' \
    grhh='git reset --hard' \
    gsh='git show'

# GitHub
alias \
    ghrepo='gh repo view --web 2>/dev/null' \
    ghpr='gh pr view --web 2>/dev/null'
