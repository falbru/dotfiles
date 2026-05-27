define-command -docstring "
find [<switches>] <pattern>: find and edit files in the current directory and subdirectories
Switches:
    -hidden include hidden files
" -params 1..2 find %{
    evaluate-commands %sh{
        [ $# -gt 1 ] && shift
        [ "$1" = "-hidden" ] && printf "%s" "fail 'find: no file specified'" && exit
        printf "%s" "edit $1"
    }
}

complete-command -menu find shell-script-candidates %{
    extra_args=""
    [ "$1" = "-hidden" ] && extra_args="-H"
    [ $# -lt 2 ] && printf "%s\n" "-hidden"
    fdfind -t f -c never $extra_args
}
