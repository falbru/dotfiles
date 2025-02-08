define-command -hidden git-update-diff-on-write %{
    hook global WinCreate .* %{ evaluate-commands %sh{
        [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ] && printf "%s\n" "
            git show-diff
            hook window BufWritePost .* %{
                git update-diff
            }"
    }}
}
