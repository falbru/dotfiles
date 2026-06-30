declare-option str git_find_extra_args ''

define-command -docstring "
git-find [<switches>] <pattern>: find and edit files managed by git
By default, only cached files will be searched
Switches:
    -all  Include excluded files
" -params 1..2 git-find %{
    evaluate-commands %sh{
        [ $# -gt 1 ] && shift
        [ "$1" = "-all" ] && printf "%s" "fail 'git-find: no file specified'" && exit
        printf "%s" "edit $1"
    }
}

complete-command -menu git-find shell-script-candidates %{
    filter_arg="-c -o --exclude-standard"

    case $1 in
        -all)
            filter_arg="-c -o"
            ;;
    esac

    [ $# -lt 2 ] && printf "%s\n%s\n" "-all"
    git ls-files -c -o $filter_arg $kak_opt_git_find_extra_args | grep -v '/$'
}
