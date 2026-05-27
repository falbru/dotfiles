evaluate-commands %sh{

fg="rgb:bcbcbc"
bg="rgb:262626"

black="rgb:1c1c1c"
red="rgb:af5f5f"
green="rgb:5f875f"
yellow="rgb:87875f"
blue="rgb:5f87af"
purple="rgb:5f5f87"
cyan="rgb:5f8787"
gray="rgb:6c6c6c"

bright_black="rgb:444444"
bright_red="rgb:ff8700"
bright_green="rgb:87af87"
bright_yellow="rgb:ffffaf"
bright_blue="rgb:87afd7"
bright_purple="rgb:8787af"
bright_cyan="rgb:5fafaf"
bright_gray="rgb:ffffff"

pure_red="rgb:ff0000"
pure_yellow="rgb:ffff00"

echo "
face global Default            ${fg},${bg}
face global PrimarySelection   ${bg},${blue}+g
face global SecondarySelection ${bg},rgba:5f87af22+g
face global PrimaryCursor      ${bg},rgb:FC3FFC+fg
face global SecondaryCursor    ${bg},${fg}+fg
face global PrimaryCursorEol   ${bg},${fg}+fg
face global SecondaryCursorEol ${bg},${fg}+fg
face global LineNumbers        ${gray},${black}
face global LineNumberCursor   ${cyan},rgb:303030
face global LineNumbersWrapped ${bg},${black}
face global MenuForeground     ${bg},${blue}
face global MenuBackground     ${fg},${bright_black}
face global MenuInfo           ${bg}
face global Information        ${fg},${gray}
face global Error              ${bg},${pure_red}
face global DiagnosticError    ${pure_red}
face global DiagnosticWarning  ${pure_yellow}
face global StatusLine         ${fg},${bg}
face global StatusLineMode     ${yellow}+b
face global StatusLineInfo     ${purple}
face global StatusLineValue    ${red}
face global StatusCursor       ${bg},${fg}
face global Prompt             ${yellow}
face global MatchingChar       ${fg},${bg}+b
face global BufferPadding      ${bg},${bg}
face global Whitespace         ${bg}+f

# Code highlighting (builtin)
face global value         ${red}
face global type          ${bright_purple}
face global variable      ${blue}
face global module        ${green}
face global function      ${fg}
face global string        ${bright_green}
face global keyword       ${bright_blue}
face global operator      ${fg}
face global attribute     ${bright_red}
face global comment       ${gray}+i
face global documentation comment
face global meta          ${cyan}
face global builtin       ${fg}+b

# Markdown highlighting
face global title     ${green}+b
face global header    ${bright_red}
face global mono      ${fg}
face global block     ${cyan}
face global link      ${blue}+u
face global bullet    ${yellow}
face global list      ${fg}

# kak-lsp

face global InfoDefault            Information
face global InfoBlock              block
face global InfoBlockQuote         block
face global InfoBullet             bullet
face global InfoHeader             header
face global InfoLink               link
face global InfoLinkMono           link
face global InfoMono               block
face global InfoRule               comment
face global InfoDiagnosticError    Error
face global InfoDiagnosticHint     Error
face global InfoDiagnosticInformation Information
face global InfoDiagnosticWarning DiagnosticWarning

# kak-tree-sitter
face global ts_attribute                                ${fg}
face global ts_comment                                  comment
face global ts_conceal                                  ${fg}
face global ts_constant                                 value
face global ts_constant_macro                           ${fg}
face global ts_constructor                              ${fg}
face global ts_diff_plus                                green
face global ts_diff_minus                               red
face global ts_diff_delta                               blue
face global ts_error                                    ${pure_red}
face global ts_function                                 ${fg}
face global ts_hint                                     ${fg}
face global ts_info                                     ${fg}
face global ts_keyword                                  keyword
face global ts_label                                    ${fg}
face global ts_markup_bold                              +b
face global ts_markup_heading                           title
face global ts_markup_italic                            +i
face global ts_markup_list_checked                      ${fg}
face global ts_markup_list_numbered                     ${fg}
face global ts_markup_list_unchecked                    ${fg}
face global ts_markup_list_unnumbered                   ${fg}
face global ts_markup_link_label                        ${fg}
face global ts_markup_link_url                          ${gray}+iu
face global ts_markup_link_uri                          ${gray}+iu
face global ts_markup_link_text                         ${fg}
face global ts_markup_quote                             block
face global ts_markup_raw                               block
face global ts_markup_raw_block                     ${fg}
face global ts_markup_raw_inline                    ${fg}
face global ts_markup_strikethrough                     ${fg}
face global ts_namespace                                ${fg}
face global ts_operator                                 ${fg}
face global ts_property                                 ${fg}
face global ts_punctuation                              ${gray}
face global ts_special                                  ${fg}
face global ts_spell                                    ${fg}
face global ts_string                                   string
face global ts_tag                                      ${fg}
face global ts_tag_error                                ${fg}
face global ts_text                                     ${fg}
face global ts_type                                     type
face global ts_variable                                 ${fg}
face global ts_warning                                  ${pure_yellow}

set-option -add global ui_options kakodemon_color_black=${black}
set-option -add global ui_options kakodemon_color_red=${red}
set-option -add global ui_options kakodemon_color_green=${green}
set-option -add global ui_options kakodemon_color_yellow=${yellow}
set-option -add global ui_options kakodemon_color_blue=${blue}
set-option -add global ui_options kakodemon_color_magenta=${purple}
set-option -add global ui_options kakodemon_color_cyan=${cyan}
set-option -add global ui_options kakodemon_color_white=${gray}

set-option -add global ui_options kakodemon_color_bright_black=${bright_black}
set-option -add global ui_options kakodemon_color_bright_red=${bright_red}
set-option -add global ui_options kakodemon_color_bright_green=${bright_green}
set-option -add global ui_options kakodemon_color_bright_yellow=${bright_yellow}
set-option -add global ui_options kakodemon_color_bright_blue=${bright_blue}
set-option -add global ui_options kakodemon_color_bright_magenta=${bright_purple}
set-option -add global ui_options kakodemon_color_bright_cyan=${bright_cyan}
set-option -add global ui_options kakodemon_color_bright_white=${bright_gray}

"

}
