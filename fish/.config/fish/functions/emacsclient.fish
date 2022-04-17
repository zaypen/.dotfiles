if command -q emacsclient
    function emacsclient --wraps emacsclient --description 'emacsclient wrapper that starts emacs daemon'
        set -l options $argv
        argparse "s/socket-name=" -- $argv >/dev/null 2>/dev/null
        if set --query $_flag_s
            if not command emacsclient -e t >/dev/null 2>/dev/null
                emacs --daemon
            end
        end
        if test (find ~/.terminfo -name xterm-24bit 2>/dev/null | wc -l) -eq "1"
            env TERM=xterm-24bit command emacsclient $options
        else
            command emacsclient $options
        end
    end
end
