declare-option -hidden str modeline_git_branch
declare-option -hidden str modeline_git_dirty
declare-option -hidden str modeline_git_fetch

define-command -hidden modeline-set-git-branch %{
    set-option buffer modeline_git_branch %sh{
        git -C "${kak_buffile%/*}" rev-parse --abbrev-ref HEAD 2>/dev/null)
    }
}

define-command -hidden modeline-set-git-dirty %{
    set-option buffer modeline_git_dirty %sh{
        if [ ! -z "$(git -C "${kak_buffile%/*}" status --porcelain)" ]; then
            printf "*"
        else
            printf ""
        fi
    }
}

define-command -hidden modeline-set-git-fetch %{
    nop %sh{
       (
           command git -c gc.auto=0 fetch \
               --quiet \
               --no-tags \
               --recurse-submodules=no \
               &>/dev/null || exit 1

           local ahead behind
           ahead=$(command git rev-list --count @'{u}'..HEAD 2>/dev/null)
           behind=$(command git rev-list --count HEAD..@'{u}' 2>/dev/null)

           if [ "$ahead" -gt 0 ]; then
               printf "evaluate-commands -buffer $kak_buffile %{ set-option buffer modeline_git_fetch ' ⇡'\n }" | kak -p "$kak_session"
           elif [ "$behind" -gt 0 ]; then
               printf "evalute-commands -buffer $kak_buffile %{ set-option buffer modeline_git_fetch ' ⇣'\n }" | kak -p "$kak_session"
           fi
       ) </dev/null >/dev/null 2>&1 &
    }
}
