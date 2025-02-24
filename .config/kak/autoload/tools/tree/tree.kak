define-command -override tree %{
    fifo -name *tree* tree
    add-highlighter buffer/tree regex [├│└]─* 0:comment
}
