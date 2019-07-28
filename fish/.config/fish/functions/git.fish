# Wrap git automatically by adding the following to ~/.config/fish/functions/git.fish:

function git --wraps hub --description 'Alias for hub, which wraps git to provide extra functionality with GitHub.'
    if type -q hub >/dev/null
        hub $argv
    else
        git $argv
    end
end
