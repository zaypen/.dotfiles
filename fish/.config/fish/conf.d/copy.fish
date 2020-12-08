function __fish_copy -d "Copy current commandline"
    commandline -b | pbcopy
end

bind \ec __fish_copy
