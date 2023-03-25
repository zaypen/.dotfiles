if test -d /Applications/MacPorts/Emacs.app
    fish_add_path --append /Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs/bin
    alias e="emacsclient -s term -t -a ''"
    alias eq="emacsclient -s term -e \"(kill-emacs)\""
    alias eg="emacsclient -c -n -a emacs"
end
