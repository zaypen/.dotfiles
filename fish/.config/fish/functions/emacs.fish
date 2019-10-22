function emacs --wraps emacsclient --description 'emacs wrapper with 24bit color'
    env TERM=xterm-24bit command emacs $argv
end
