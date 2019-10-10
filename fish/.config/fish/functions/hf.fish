function hf --wraps history --description 'Show and manipulate command history and fuzzy search it, glhf'
    if type -q fzy >/dev/null
        commandline -r (history $argv | fzy || echo '')
    else
        history $argv
    end
end
