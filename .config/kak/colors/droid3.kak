evaluate-commands %sh{
    black="rgb:222222"
    medium_gray="rgb:767676"
    white="rgb:C5C5C5"
    actual_white="rgb:FFFFFF"
    light_black="rgb:424242"
    lighter_black="rgb:545454"
    subtle_black="rgb:303030"
    light_gray="rgb:B2B2B2"
    lighter_gray="rgb:C6C6C6"
    subtle_gray="rgb:696969"
    pink="rgb:fb007a"
    dark_red="rgb:C30771"
    light_red="rgb:E32791"
    orange="rgb:D75F5F"
    darker_blue="rgb:005F87"
    dark_blue="rgb:008EC4"
    blue="rgb:20BBFC"
    light_blue="rgb:b6d6fd"
    dark_cyan="rgb:20A5BA"
    light_cyan="rgb:4FB8CC"
    dark_green="rgb:10A778"
    light_green="rgb:5FD7A7"
    dark_purple="rgb:523C79"
    light_purple="rgb:6855DE"
    yellow="rgb:F3E430"
    dark_yellow="rgb:A89C14"

    echo "
        # Code highlighting
        face global value              ${white},${black}
        face global type               ${white},${black}
        face global variable           ${white},${black}
        face global module             ${white},${black}
        face global function           ${white},${black}
        face global string             ${white},${black}+i
        face global keyword            ${white},${black}+b
        face global operator           ${white},${black}
        face global attribute          ${white},${black}
        face global comment            ${subtle_gray}
        face global documentation      comment
        face global meta               ${white},${black}
        face global builtin            ${white},${black}

        # Markdown highlighting
        face global title              ${white},${black}+b
        face global header             ${white},${black}+b
        face global mono               ${white},${black}+i
        face global block              ${white},${black}
        face global link               comment
        face global bullet             ${white},${black}
        face global list               ${white},${black}

        face global Default            ${white},${black}
        face global PrimarySelection   ${black},${white}+g
        face global SecondarySelection ${black},${white}+g
        face global PrimaryCursor      ${black},${actual_white}+fg
        face global SecondaryCursor    ${black},${white}+fg
        face global PrimaryCursorEol   ${black},${white}+fg
        face global SecondaryCursorEol ${black},${white}+fg
        face global LineNumbers        comment
        face global LineNumberCursor   ${white},${black}+b
        face global LineNumbersWrapped LineNumbers
        face global MenuForeground     ${white},"rgb:404040"
        face global MenuBackground     ${white},"rgb:323232"
        face global MenuInfo           ${white},"rgb:323232"
        face global Information        ${white},"rgb:323232"
        face global Error              ${white},${black}
        face global DiagnosticError    ${white},${black}
        face global DiagnosticWarning  ${white},${black}
        face global StatusLine         ${white},"rgb:323232"
        face global StatusLineMode     ${white},"rgb:323232"
        face global StatusLineInfo     ${white},"rgb:323232"
        face global StatusLineValue    ${white},"rgb:323232"
        face global StatusCursor       ${black},${white}
        face global Prompt             ${white},"rgb:323232"
        face global MatchingChar       ${white},${black}
        face global BufferPadding      ${white},${black}
        face global Whitespace         ${white},${black}

        set-option -add global ui_options 'gui_set_color_gray=${medium_gray}'
        set-option -add global ui_options 'gui_set_color_red=${light_red}'
        set-option -add global ui_options 'gui_set_color_green=${light_green}'
        set-option -add global ui_options 'gui_set_color_yellow=${light_yellow}'
        set-option -add global ui_options 'gui_set_color_blue=${light_blue}'
        set-option -add global ui_options 'gui_set_color_magenta=${light_purple}'
        set-option -add global ui_options 'gui_set_color_cyan=${light_cyan}'
        set-option -add global ui_options 'gui_set_color_white=${white}'
    "
}
