declare-option str dirname

hook global BufNewFile .* %{
    set-option buffer dirname %sh{ dirname $kak_buffile }
}

hook global BufOpenFile .* %{
    set-option buffer dirname %sh{ dirname $kak_buffile }
}
