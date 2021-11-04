function emacs --wraps emacs --description 'emacs wrapper with 24bit color'
    if test (find ~/.terminfo -name xterm-24bit | wc -l) -eq "1"
        env TERM=xterm-24bit command emacs $argv
    else
        command emacs $argv
    end
end
