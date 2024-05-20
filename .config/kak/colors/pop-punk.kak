# pop-punk theme
# ported from https://github.com/bignimbus/pop-punk.vim

evaluate-commands %sh{
    white='rgb:ffffff'
    gray_1='rgb:1a1a1a'
    gray_2='rgb:2e373e'
    gray_3='rgb:3a3a3a'
    gray_4='rgb:5a5a5a'
    gray_5='rgb:767c88'
    gray_6='rgb:8b8a7c'
    gray_7='rgb:8787af'
    black='rgb:000000'
    eggshell='rgb:ffffcd'
    mauve='rgb:e4dfff'
    blue='rgb:0088ff'
    teal='rgb:40e0d0'
    magenta='rgb:c526ff'
    burgundy='rgb:5f2a5f'
    red_1='rgb:d70061'
    red_2='rgb:ff005f'
    orange='rgb:ff9d00'
    sun='rgb:ffdd00'
    yellow='rgb:ffff00'
    pink='rgb:f9e0f5'
    green='rgb:5ff967'
    cobalt_1='rgb:306b8f'
    cobalt_2='rgb:445291'

    echo "
        # Code highlighting
        face global value         ${red_2}
        face global type          ${white}
        face global variable      ${blue}
        face global module        ${orange}
        face global function      ${blue}
        face global string        ${green}
        face global keyword       ${teal}
        face global operator      ${magenta}
        face global attribute     ${teal}+b
        face global comment       ${blue}
        face global documentation comment
        face global meta          ${magenta}
        face global builtin       ${magenta}

        # Markdown highlighting
        face global title     ${magenta}+b
        # face global header    ${orange}
        # face global mono      ${fg4}
        # face global block     ${aqua}
        # face global link      ${blue}+u
        # face global bullet    ${yellow}
        # face global list      ${fg}

        face global Default            ${white},${black}
        face global PrimarySelection   ${gray_1},${magenta}
        face global SecondarySelection ${gray_1},${blue}
        face global PrimaryCursor      ${gray_1},${mauve}+fg
        face global SecondaryCursor    ${gray_1},${teal}
        face global PrimaryCursorEol   ${gray_1},${gray_7}+fg
        face global SecondaryCursorEol ${bg},${cobalt_1}+fg
        face global LineNumbers        ${gray_7}
        face global LineNumberCursor   ${yellow}
        face global LineNumbersWrapped ${gray_1}
        face global MenuForeground     ${white},${red_1}
        face global MenuBackground     ${teal},${gray_2}
        face global MenuInfo           ${yellow}
        face global Information        ${black},${red_1}
        face global Error              ${red_2}
        face global DiagnosticError    ${red_2}
        face global DiagnosticWarning  ${yellow}
        face global StatusLine         ${gray_7},${black}
        face global StatusLineMode     ${gray_7},${black}
        face global StatusLineInfo     ${gray_7},${black}
        face global StatusLineValue    ${gray_7},${black}
        face global StatusCursor       ${gray_1},${mauve}
        face global Prompt             ${magenta}
        face global MatchingChar       ${black},${magenta}+fb
        # face global BufferPadding      ${bg2},${bg}
        # face global Whitespace         ${bg2}+f

        set-option -add global ui_options 'gui_set_color_gray=${gray_7}'
        set-option -add global ui_options 'gui_set_color_red=${red_1}'
        set-option -add global ui_options 'gui_set_color_green=${green}'
        set-option -add global ui_options 'gui_set_color_yellow=${yellow}'
        set-option -add global ui_options 'gui_set_color_blue=${blue}'
        set-option -add global ui_options 'gui_set_color_magenta=${magenta}'
        set-option -add global ui_options 'gui_set_color_cyan=${teal}'
        set-option -add global ui_options 'gui_set_color_white=${white}'
    "
}
