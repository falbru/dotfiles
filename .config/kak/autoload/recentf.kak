hook global BufOpenFile .* recentf-add-file
hook global BufWritePost .* recentf-add-file

declare-option str recentf_file "%val{config}/.recentf"
declare-option int max_recentf_files 750

define-command -hidden recentf-add-file %{ nop %sh{
    if ! grep -q "${kak_buffile}" "${kak_opt_recentf_file}"; then
        printf "%s\n%s\n" "${kak_buffile}" "$(cat ${kak_opt_recentf_file})" > ${kak_opt_recentf_file}
        printf "%s\n" "$(head -${kak_opt_max_recentf_files} ${kak_opt_recentf_file})" > ${kak_opt_recentf_file}
    fi
}}

define-command recentf -params 1 -shell-script-candidates %{ cat ${kak_opt_recentf_file} } %{ edit -existing %arg{1} }
