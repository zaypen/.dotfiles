if test -d /Applications/MacPorts/Emacs.app
    fish_add_path --append /Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs/bin
    alias emacs=Emacs
    alias e="emacsclient -s term -t -a emacs"
    alias eg="emacsclient -c -n -a emacs"
end
