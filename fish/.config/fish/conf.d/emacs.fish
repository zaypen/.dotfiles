if test -d /Applications/MacPorts/Emacs.app
    fish_add_path --append /Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs/bin
    alias e="emacsclient -t -a ''"
    alias eg="emacsclient -nc -a ''"
end
