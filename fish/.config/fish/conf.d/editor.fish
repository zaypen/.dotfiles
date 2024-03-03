if command -q emacs
    set -x VISUAL emacsclient -t -socket-name=cli -a emacs
    set -x EDITOR vi
end
