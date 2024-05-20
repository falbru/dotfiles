define-command -params 1 ghq-cd %{ evaluate-commands %sh{
    project_dir=$(ghq root)/$1

    if [ ! -d $project_dir ]; then
        printf %s\\n "echo -markup {Error}'$1' is not a directory"
        return 1
    fi

    printf %s\\n "cd $project_dir"
    printf %s\\n "try %{ source .local.kak }"
    echo $1 >> ~/.kak_history
}}
complete-command ghq-cd shell-script-candidates %{ ghq list }

define-command -params 1 ghq-create %{

}

define-command -params 1 ghq-get-and-cd %{

}
