for _file in .config/zsh/modules.d/*.zsh; do
    _basename=$(basename "$_file" .zsh)
    is_ignored=false
    for _module in "${ZSH_IGNORED_MODULES[@]}"; do
        [ "$_module" = "$_basename" ] && is_ignored=true
    done

    [ "$is_ignored" = false ] && source "$_file"
done
