# name: kakoune_git_status
# version: 0.1.0
# description: This script provides support for the "git status" command-line utility.
# authors: ["Mathieu Ablasou <taupiqueur.kanto@gmail.com>"]
# kakoune: 2023-12-12
# license: MIT
# dependencies: ["fifo", "ls"]
# doc: no
# tests: no

hook global BufCreate '\*git-status\*' %{
  set-option buffer filetype git_status
}

hook global BufSetOption filetype=git_status %{
  add-highlighter buffer/git_status ref git_status
  map -docstring 'jump to files' buffer normal <ret> ':git_status_jump_to_files<ret>'
}

declare-option str-list git_status_command git status --porcelain=v1 --no-renames

define-command git-status -params .. %{
  evaluate-commands -try-client %opt{toolsclient} %{
    fifo -name '*git-status*' -- %opt{git_status_command} -- %arg{@}
  }
}

complete-command git-status file

define-command -hidden git_status_jump_to_files %{
  evaluate-commands -draft %{
    execute-keys 'x<a-s><a-K>^\n<ret>Hs^.. \K.+$<ret>'
    evaluate-commands -draft -verbatim try %{
      execute-keys '<a-,><a-K>/\z<ret>'
      evaluate-commands -itersel %{
        evaluate-commands -draft -verbatim edit -existing -- %val{selection}
      }
    }
    evaluate-commands -draft -verbatim try %{
      execute-keys ',<a-k>/\z<ret>'
      evaluate-commands -client %val{client} -verbatim ls %val{selection}
    } catch %{
      evaluate-commands -client %val{client} -verbatim edit -existing -- %val{selection}
    }
  }
}

add-highlighter shared/git_status group
add-highlighter shared/git_status/ regex '^([ ACDMRTU])([ ACDMRTU])' 1:green 2:red
add-highlighter shared/git_status/ regex '^\?\?|^!!' 0:red
