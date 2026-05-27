declare-option str git_find_extra_args ''

define-command -docstring "
git-find [<switches>] <pattern>: find and edit files managed by git
By default, only cached files will be searched
Switches:
    -others  Untracked files only
" -params 1..2 git-find %{
    evaluate-commands %sh{
        [ $# -gt 1 ] && shift
        [ "$1" = "-others" ] && printf "%s" "fail 'git-find: no file specified'" && exit
        printf "%s" "edit $1"
    }
}

complete-command -menu git-find shell-script-candidates %{
    filter_arg="-c"

    case $1 in
        -others)
            filter_arg="-o"
            ;;
    esac

    [ $# -lt 2 ] && printf "%s\n%s\n" "-others"
    git ls-files $filter_arg $kak_opt_git_find_extra_args | grep -v '/$'
}
