function ls --wraps exa --description 'Alias for exa'
    if type -q exa >/dev/null
        exa --group-directories-first $argv
    else
        command ls $argv
    end
end
