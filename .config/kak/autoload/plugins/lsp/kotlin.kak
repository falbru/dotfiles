hook -group lsp-filetype-kotlin global BufSetOption filetype=kotlin %{
    set-option buffer lsp_servers %{
        [clangd]
        args = ["--log=error"]
        root_globs = ["mvnw", "gradlew", ".git", ".hg"]
    }
}
