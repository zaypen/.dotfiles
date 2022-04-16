if command -q emacs
    and command -q emacsclient
    set -x VISUAL emacsclient -t -a "emacs -q"
    set -x EDITOR emacsclient -t -a "emacs -q"
end
