define-command -override ide %{
    rename-client main
    set-option global jumpclient main

    kakqt-split-vertical rename-client tools
    set-option global toolsclient tools
}
