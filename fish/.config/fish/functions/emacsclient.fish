function emacsclient --wraps emacsclient --description 'emacsclient wrapper that starts emacs daemon'
    set -l options $argv
    argparse "s/socket-name=" -- $argv >/dev/null 2>/dev/null
    if set --query $_flag_s
        if not command emacsclient -e t >/dev/null 2>/dev/null
            screen emacs --daemon
        end
    end
    env TERM=xterm-24bit command emacsclient $options
end
