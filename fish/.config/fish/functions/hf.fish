function hf --wraps history --description 'Show and manipulate command history and fuzzy search it, glhf'
    if type -q fzy >/dev/null
        commandline -r (history $argv -z | sed -z -r s/\\\\\\n// | tr "\0" "\n" | fzy || echo "")
    else
        history $argv
    end
end

