function ls --wraps lsd --description 'Alias for lsd'
    if type -q lsd >/dev/null
        lsd $argv --icon never
    else
        ls $argv
    end
end
