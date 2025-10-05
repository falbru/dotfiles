define-command -override -docstring \
"tree [arguments]: execute tree" \
tree -params .. %{
   try %{
      delete-buffer *tree*
   }
   edit -scratch *tree*
   execute-keys "! tree --charset ASCII -f %arg{@}<ret>%%s^[\h|\-`]+<ret>r<space>gg"
}

complete-command tree file

# define-command -file-completion -params .. -docstring \
#   "tree [<arguments>]: execute tree into a scratch buffer, with the following options :
# - -f to have full pathnames (easier to gf).
# - --charset to have indentation using plain space characters instead of fancy character art (easier to gf, after replacing any fancy character with space).
# - whatever arguments provided." \
# tree %{
#   try %{
#      delete-buffer *tree*
#   }
#   edit -scratch *tree*
#   execute-keys "! tree -f --charset ASCII %arg{@}<ret>%%s^[\h|\-`]+<ret>r<space>gg"
#   map buffer normal <ret> 'x: goto-file<ret>'
# }
