# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
[ -e $OMF_PATH/init.fish ] && source $OMF_PATH/init.fish

if ! status --is-interactive
  set -g theme_powerline_fonts no
end
