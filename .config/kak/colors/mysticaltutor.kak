evaluate-commands %sh{

black="rgb:1E2227"
darkgray="rgb:30343C"
gray="rgb:A0A4AA"
red="rgb:E07093"
brightred="rgb:DFB4C9"
green="rgb:8BBE67"
brightgreen="rgb:B1C6AC"
yellow="rgb:BB8E67"
brightyellow="rgb:C3B470"
darkblue="rgb:304A68"
blue="rgb:5C8EC7"
brightblue="rgb:A0B4CF"
magenta="rgb:8B5FC7"
brightmagenta="rgb:B1A3DF"
cyan="rgb:5CBE97"
brightcyan="rgb:A0C4BD"
white="rgb:D9D9D9"
brightwhite="rgb:FFFFFF"

echo "
face global Default            ${white},${black}
face global PrimarySelection   default,rgba:5C8EC780
face global SecondarySelection default,rgba:5C8EC740
face global PrimaryCursor      ${black},${white}+fg
face global SecondaryCursor    ${black},${gray}+fg
face global PrimaryCursorEol   ${black},${brightmagenta}+fg
face global SecondaryCursorEol ${black},${magenta}+fg
face global LineNumbers        ${gray}@Default
face global LineNumberCursor   +b@LineNumbers
face global LineNumbersWrapped +d@LineNumbers
face global MenuForeground     ${blue},default+b@MenuBackground
face global MenuBackground     default,${darkgray}@Default
face global MenuInfo           +i
face global Information        default,${darkgray}@Default
face global Error              ${red}+b@Default
face global StatusLine         @Default
face global StatusLineMode     ${yellow}@Default
face global StatusLineInfo     ${blue}@Default
face global StatusLineValue    ${green}@Default
face global StatusCursor       ${black},${cyan}
face global Prompt             ${yellow}
face global MatchingChar       +b
face global Whitespace         ${gray}+f
face global BufferPadding      ${gray}
face global WrapMarker         ${gray}+f

# Code highlighting (builtin)
face global value     ${red}
face global type      ${magenta}
face global variable  ${cyan}
face global module    ${brightgreen}
face global function  ${brightmagenta}
face global string    ${green}
face global keyword   ${blue}
face global operator  ${blue}
face global attribute ${yellow}
face global comment   ${gray}
face global meta      ${brightgreen}
face global builtin   ${brightmagenta}

# Markdown highlighting
face global title  ${blue}
face global header ${cyan}
face global mono   ${green}
face global block  ${magenta}
face global link   ${cyan}
face global bullet ${cyan}
face global list   ${yellow}

# kak-lsp

# kak-tree-sitter
face global ts_attribute                                ${white}
face global ts_comment                                  comment
face global ts_conceal                                  ${white}
face global ts_constant                                 value
face global ts_constant_macro                           ${white}
face global ts_constructor                              ${white}
face global ts_diff_plus                                green
face global ts_diff_minus                               red
face global ts_diff_delta                               blue
face global ts_error                                    ${brightred}
face global ts_function                                 ${white}
face global ts_hint                                     ${white}
face global ts_info                                     ${white}
face global ts_keyword                                  keyword
face global ts_label                                    ${white}
face global ts_markup_bold                              +b
face global ts_markup_heading                           ${white}
face global ts_markup_italic                            +i
face global ts_markup_list_checked                      ${white}
face global ts_markup_list_numbered                     ${white}
face global ts_markup_list_unchecked                    ${white}
face global ts_markup_list_unnumbered                   ${white}
face global ts_markup_link_label                        ${white}
face global ts_markup_link_url                          ${gray}+iu
face global ts_markup_link_uri                          ${gray}+iu
face global ts_markup_link_text                         ${white}
face global ts_markup_quote                             ${white}
face global ts_markup_raw                               ${white}
face global ts_markup_raw_block                     ${white}
face global ts_markup_raw_inline                    ${white}
face global ts_markup_strikethrough                     ${white}
face global ts_namespace                                ${white}
face global ts_operator                                 ${white}
face global ts_property                                 ${white}
face global ts_punctuation                              ${gray}
face global ts_special                                  ${white}
face global ts_spell                                    ${white}
face global ts_string                                   string
face global ts_tag                                      ${white}
face global ts_tag_error                                ${white}
face global ts_text                                     ${white}
face global ts_type                                     type
face global ts_variable                                 ${white}
face global ts_warning                                  ${brightyellow}

# kakodemon
set-option -add global ui_options kakodemon_color_black=${black}
set-option -add global ui_options kakodemon_color_red=${red}
set-option -add global ui_options kakodemon_color_green=${green}
set-option -add global ui_options kakodemon_color_yellow=${yellow}
set-option -add global ui_options kakodemon_color_blue=${blue}
set-option -add global ui_options kakodemon_color_magenta=${magenta}
set-option -add global ui_options kakodemon_color_cyan=${cyan}
set-option -add global ui_options kakodemon_color_white=${white}
set-option -add global ui_options kakodemon_color_bright_black=${darkgray}
set-option -add global ui_options kakodemon_color_bright_red=${brightred}
set-option -add global ui_options kakodemon_color_bright_green=${brightgreen}
set-option -add global ui_options kakodemon_color_bright_yellow=${brightyellow}
set-option -add global ui_options kakodemon_color_bright_blue=${darkblue}
set-option -add global ui_options kakodemon_color_bright_magenta=${brightmagenta}
set-option -add global ui_options kakodemon_color_bright_cyan=${brightcyan}
set-option -add global ui_options kakodemon_color_bright_white=${brightwhite}
"

}
