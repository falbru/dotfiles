define-command -hidden surround-surround-with-object -params 2 %{
    evaluate-commands -save-regs 'lr' %{
        set-register l "%arg{1}"
        set-register r "%arg{2}"
        execute-keys "a<c-r>r<esc>i<c-r>l<esc>H"
        execute-keys "<a-:>"
    }
}

define-command -hidden surround-surround-with-tag -params 1.. %{
    execute-keys "a<lt>/%arg{1}><esc>i<lt>%arg{@}><esc>"
    execute-keys "<a-a>c<lt>([\w.]+)\b[^>]*?(?<lt>!/)>,<lt>/([\w.]+)\b[^>]*?(?<lt>!/)><ret>"
    execute-keys "<a-:>"
}

define-command -hidden surround-delete-object -params 2 %{
    evaluate-commands -save-regs 'iolr' %{
            set-register l %arg{1}
            set-register r %arg{2}

            try %{
                execute-keys -draft '<a-:>;<a-k><c-r>r<ret>'
                execute-keys -draft '<a-:><a-;>;<a-k><c-r>l<ret>'
            } catch %{
                fail "selection not surrounded by %arg{1} %arg{2}"
            }
            execute-keys '"oZ<a-:>H<a-;>L"iZ"oz<a-S>d"iz<a-:>'
    }
}

# TODO doesn't work for empty tags
define-command -hidden surround-delete-tag %{
    evaluate-commands -save-regs 'oi' %{
        execute-keys '<a-S>"oZ'
        execute-keys '<a-i>c<lt>([\w.]+)\b[^>]*?(?<lt>!/)>,<lt>/([\w.]+)\b[^>]*?(?<lt>!/)><ret>'
        execute-keys '"iZ<a-:>L<a-;>H<a-S>"o<a-z>ud"iz'
    }
}

define-command -hidden surround-insert-tag -params 1.. %{
    evaluate-commands -save-regs 'r' %{
        execute-keys "<esc>i<lt>%arg{@}><esc>"
        execute-keys 'h"rZl'
        execute-keys "i<lt>/%arg{1}><esc>"
        execute-keys '"rzl'
    }
}

declare-user-mode surround
declare-user-mode surround-delete

map -docstring 'parenthesis block' global surround b ":surround-surround-with-object ( )<ret>"
map -docstring 'parenthesis block' global surround-delete b ":surround-delete-object '\(' '\)'<ret>"
map -docstring 'parenthesis block' global surround ( ":surround-surround-with-object ( )<ret>"
map -docstring 'parenthesis block' global surround-delete ( ":surround-delete-object '\(' '\)'<ret>"
map -docstring 'parenthesis block' global surround ) ":surround-surround-with-object ( )<ret>"
map -docstring 'parenthesis block' global surround-delete ) ":surround-delete-object '\(' '\)'<ret>"

map -docstring 'brace block' global surround B ":surround-surround-with-object [ ]<ret>"
map -docstring 'brace block' global surround-delete B ":surround-delete-object '\[' '\]'<ret>"
map -docstring 'brace block' global surround [ ":surround-surround-with-object [ ]<ret>"
map -docstring 'brace block' global surround-delete [ ":surround-delete-object '\[' '\]'<ret>"
map -docstring 'brace block' global surround ] ":surround-surround-with-object [ ]<ret>"
map -docstring 'brace block' global surround-delete ] ":surround-delete-object '\[' '\]'<ret>"

map -docstring 'bracket block' global surround r ":surround-surround-with-object { }<ret>"
map -docstring 'bracket block' global surround-delete r ":surround-delete-object '\{' '\}'<ret>"
map -docstring 'bracket block' global surround { ":surround-surround-with-object { }<ret>"
map -docstring 'bracket block' global surround-delete { ":surround-delete-object '\{' '\}'<ret>"
map -docstring 'bracket block' global surround } ":surround-surround-with-object { }<ret>"
map -docstring 'bracket block' global surround-delete } ":surround-delete-object '\{' '\}'<ret>"

map -docstring 'angle block' global surround <lt> ":surround-surround-with-object '<lt>' '<gt>'<ret>"
map -docstring 'angle block' global surround-delete <lt> ":surround-delete-object <lt> <gt><ret>"
map -docstring 'angle block' global surround <gt> ":surround-surround-with-object '<lt>' '<gt>'<ret>"
map -docstring 'angle block' global surround-delete <gt> ":surround-delete-object <lt> <gt><ret>"

map -docstring 'double quote' global surround '"' ":surround-surround-with-object '<dquote>' '<dquote>'<ret>"
map -docstring 'double quote' global surround-delete '"' ":surround-delete-object '<dquote>' '<dquote>'<ret>"
map -docstring 'double quote' global surround Q ":surround-surround-with-object '<dquote>' '<dquote>'<ret>"
map -docstring 'double quote' global surround-delete Q ":surround-delete-object '<dquote>' '<dquote>'<ret>"

map -docstring 'single quote' global surround "'" ':surround-surround-with-object "<quote>" "<quote>"<ret>'
map -docstring 'single quote' global surround-delete "'" ':surround-delete-object "<quote>" "<quote>"<ret>'
map -docstring 'single quote' global surround q ':surround-surround-with-object "<quote>" "<quote>"<ret>'
map -docstring 'single quote' global surround-delete q ':surround-delete-object "<quote>" "<quote>"<ret>'

map -docstring 'grave quote' global surround ` ":surround-surround-with-object '`' '`'<ret>"
map -docstring 'grave quote' global surround-delete ` ":surround-delete-object '`' '`'<ret>"
map -docstring 'grave quote' global surround g ":surround-surround-with-object '`' '`'<ret>"
map -docstring 'grave quote' global surround-delete g ":surround-delete-object '`' '`'<ret>"

map -docstring 'xml tag block' global surround x ':prompt "Tag: " %{ evaluate-commands %sh{ printf "%s\n" "surround-surround-with-tag $kak_text" } }<ret>'
map -docstring 'xml tag block' global surround-delete x ":surround-delete-tag<ret>"
