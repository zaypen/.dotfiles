if command -q emacs
    set -x VISUAL emacsclient -s term -t -a emacs
    set -x EDITOR vi
end
