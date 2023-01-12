if command -q emacsclient
    set -x VISUAL emacsclient -t -a emacs
    set -x EDITOR emacsclient -t -a emacs
end
