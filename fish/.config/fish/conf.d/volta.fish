if [ -d $HOME/.volta ]
    set -gx VOLTA_HOME "$HOME/.volta"
    fish_add_path --prepend $VOLTA_HOME/bin
end
