# pnpm
set -gx PNPM_HOME '/home/yapengz/.local/share/pnpm'
if test "$PATH[1]" != "$PNPM_HOME/bin"
    set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end

bind alt-backspace backward-kill-word
