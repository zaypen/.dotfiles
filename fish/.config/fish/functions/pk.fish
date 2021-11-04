if type -q peco >/dev/null
    function pk --description 'Kill progress from select'
        ps aux | peco | awk '{print $2}' | xargs kill
    end
end
