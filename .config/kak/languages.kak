# language dependent settings
hook global WinSetOption filetype=(javascript|typescript|json|yaml|css|html) %{
    set-option buffer tabstop 2
    set-option buffer indentwidth 2
}
