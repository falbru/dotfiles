if type -q eza
    alias ls="eza"
end

alias ll="ls -l"
alias la="ll -a"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias e="$EDITOR"
alias o="xdg-open"

# git
function git_current_branch
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo ref | sed s-refs/heads--
end

function git_main_branch
    for ref in main master
        if command git show-ref -q --verify "refs/heads/$ref"
            echo $ref
            return
        end
    end
    echo "master"
end

abbr -a g 'git'
abbr -a ginit 'git init'
abbr -a gcl 'git clone --recurse-submodules'
abbr -a gst 'git status'
abbr -a ga 'git add'
abbr -a gaa 'git add --all'
abbr -a gc 'git commit -v'
abbr -a gc! 'git commit -v --amend'
abbr -a gcn! 'git commit -v --no-edit --amend'
abbr -a gl 'git pull'
abbr -a gp 'git push'
abbr -a gpf 'git push --force-with-lease'
abbr -a gpsup 'git push --set-upstream origin $(git_current_branch)'
abbr -a gb 'git branch'
abbr -a gco 'git checkout'
abbr -a gcm 'git checkout $(git_main_branch)'
abbr -a gcb 'git checkout -b'
abbr -a glg 'git log --stat'
abbr -a gd 'git diff'
abbr -a gdca 'git diff --cached'
abbr -a grb 'git rebase'
abbr -a grbm 'git rebase $(git_main_branch)'
abbr -a grs 'git restore'
abbr -a grst 'git restore --staged'
