# 2 spaces for tabs
hook global BufSetOption filetype=(javascript|typescript|json|yaml|css|html) %{
    set-option buffer tabstop 2
    set-option buffer indentwidth 2
}

# python
hook global BufSetOption filetype=python %{
    set-option buffer lintcmd "flake8 --filename='*' --format='%%(path)s:%%(row)d:%%(col)d: error: %%(text)s' --ignore=E121,E123,E126,E226,E242,E704,W503,W504,E501,E221,E127,E128,E129,F405"
    set-option buffer formatcmd 'black -'
}
