# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme harmony

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Aliases
if which /Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs >/dev/null; alias emacs=/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs; end
alias e="emacs -nw"
if which hub >/dev/null; alias git=hub; end

# Export external editor
set -gx VISUAL "emacs -nw"
set -gx EDITOR "emacs -nw"
