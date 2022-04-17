if command -q emacs
    function emacs --wraps emacs --description 'emacs wrapper with 24bit color'
        if test (find ~/.terminfo -name xterm-24bit 2>/dev/null | wc -l) -eq "1"
            env TERM=xterm-24bit command emacs $argv
        else
            command emacs $argv
        end
    end
end
