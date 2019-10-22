function emacsclient --wraps emacsclient --description 'emacsclient wrapper that starts emacs daemon'
    if not pgrep emacs >/dev/null
        emacs --daemon
    end
    env TERM=xterm-24bit command emacsclient $argv
end
