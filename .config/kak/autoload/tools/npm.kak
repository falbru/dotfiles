define-command -override -docstring '
npm <subcommand>: hey
Subcommands:
    install
    run
    version
' -params .. npm %{
    evaluate-commands %sh{
        case $1 in
            install)
                ;;
            run)
                ;;
            version)
                printf "%s\n" "echo $(npm version)"
                ;;
        esac
    }

}
