# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Aliases
if which /Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs >/dev/null; alias emacs=/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs; end
alias e="emacs -nw"

# Export external editor
set -gx VISUAL "emacs -nw"
set -gx EDITOR "emacs -nw"
