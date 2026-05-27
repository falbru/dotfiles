# TODO: SNAPSHOT CURRENT VERSION AND SIMPLIFY. NO pairs-register-object. JUST DO SURROUND AND DELETE... but what about inserting tags?


define-command -hidden -override pairs-insert-with-object -params 2 %{
    evaluate-commands -save-regs 'lr' %{
        set-register l "%arg{1}"
        set-register r "%arg{2}"
        execute-keys "i<c-r>l<c-r>r<esc>h"
    }
}

define-command -hidden -override pairs-insert-tag -params 1.. %{
    evaluate-commands -save-regs 'r' %{
        execute-keys "<esc>i<lt>%arg{@}><esc>"
        execute-keys 'h"rZl'
        execute-keys "i<lt>/%arg{1}><esc>"
        execute-keys '"rzl'
    }
}

# TODO doesn't work if nothing inside pairs
# TODO: bruke objektet under cursor? Prøv alle objects, og bruk den minste. bruk Z til dette.
#       Faktisk tror jeg det er best å ikke automatisk gjenkjenne objektet. Kan føre til uforutsette hendelser. Tror det er bedre å anta at du har wrappa rundt hele objektet. fail hvis den ikke gjenkjenner, kanskje?
define-command -hidden -override pairs-delete-object -params 1 %{
    evaluate-commands -save-regs 'oi' %{
        execute-keys '<a-S>"oZ'
        execute-keys "<a-i>%arg{1}"
        execute-keys '"iZ<a-:>L<a-;>H<a-S>"o<a-z>ud"iz'
    }
}

# TODO doesn't work for empty tags
define-command -hidden -override pairs-delete-tag %{
    evaluate-commands -save-regs 'oi' %{
        execute-keys '<a-S>"oZ'
        execute-keys '<a-i>c<lt>([\w.]+)\b[^>]*?(?<lt>!/)>,<lt>/([\w.]+)\b[^>]*?(?<lt>!/)><ret>'
        execute-keys '"iZ<a-:>L<a-;>H<a-S>"o<a-z>ud"iz'
    }
}

define-command -hidden -override pairs-surround-with-object -params 2 %{
    evaluate-commands -save-regs 'lr' %{
        set-register l "%arg{1}"
        set-register r "%arg{2}"
        execute-keys "a<c-r>r<esc>i<c-r>l<esc>H"
        execute-keys "<a-:>"
    }
}

define-command -hidden -override pairs-surround-with-tag -params 1.. %{
    execute-keys "a<lt>/%arg{1}><esc>i<lt>%arg{@}><esc>"
    execute-keys "<a-a>c<lt>([\w.]+)\b[^>]*?(?<lt>!/)>,<lt>/([\w.]+)\b[^>]*?(?<lt>!/)><ret>"
    execute-keys "<a-:>"
}

declare-user-mode pairs
declare-user-mode pairs-insert
declare-user-mode pairs-change
declare-user-mode pairs-surround
declare-user-mode pairs-delete

map -docstring 'insert pairs' global pairs i ':enter-user-mode pairs-insert<ret>'
map -docstring 'change pairs' global pairs c ':enter-user-mode pairs-change<ret>'
map -docstring 'delete pairs' global pairs d ':enter-user-mode pairs-delete<ret>'
map -docstring 'surround pairs' global pairs s ':enter-user-mode surround<ret>'

define-command -override -docstring '

' -hidden pairs-register-object -params 4.. %{
    map -docstring %arg{4} global pairs-insert %arg{1} ":pairs-insert-with-object %arg{2} %arg{3}<ret>"
    map -docstring %arg{4} global pairs-surround %arg{1} ":pairs-surround-with-object %arg{2} %arg{3}<ret>"
    map -docstring %arg{4} global pairs-delete %arg{1} ":pairs-delete-object %arg{2}<ret>"
}

pairs-register-object b ( ) 'parenthesis block'
pairs-register-object ( ( ) 'parenthesis block'
pairs-register-object ) ( ) 'parenthesis block'

pairs-register-object B [ ] 'brace block'
pairs-register-object [ [ ] 'brace block'
pairs-register-object ] [ ] 'brace block'

pairs-register-object r { } 'bracket block'
pairs-register-object { { } 'bracket block'
pairs-register-object } { } 'bracket block'

pairs-register-object <lt> 'lt' 'gt' 'angle block'
pairs-register-object <gt> 'lt' 'gt' 'angle block'

pairs-register-object <dquote> '"' '"' 'double quote'
pairs-register-object Q '"' '"' 'double quote'

pairs-register-object <quote> '<quote>' '<quote>' 'single quote'
# pairs-register-object q %|<quote>| %|<quote>| 'single quote'

pairs-register-object ` '`' '`' 'grave quote'
pairs-register-object g '`' '`' 'grave quote'

map -docstring 'xml tag block' global pairs-surround x ':prompt "Tag " %{ evaluate-commands %sh{ printf "%s" "pairs-surround-with-tag $kak_text" } }<ret>'
map -docstring 'xml tag block' global pairs-insert x ':prompt "Tag " %{ evaluate-commands %sh{ printf "%s" "pairs-insert-tag $kak_text" } }<ret>'

map global normal <minus> ':enter-user-mode pairs-surround<ret>'
map global normal <a-minus> ':enter-user-mode pairs<ret>'
