set -g fish_greeting

if type -q kak
    set EDITOR kak
end

source ~/.config/fish/abbrs.fish

if test -f /usr/share/fzf/shell/key-bindings.fish 
    source /usr/share/fzf/shell/key-bindings.fish
    fzf_key_bindings
end
