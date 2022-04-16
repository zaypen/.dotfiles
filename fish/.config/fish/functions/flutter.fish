function flutter --wraps flutter
    if [ (count $argv) -eq 1 ] 
        and [ $argv[(count $argv)] = "mirror" ]
        if curl -I --connect-timeout 1 https://www.google.com > /dev/null 2>&1
            echo "Disabling mirror" 1>&2
            __fish_flutter_disable_mirror
        else
            echo "Enabling mirror" 1>&2
            __fish_flutter_enable_mirror
        end
    else
        command flutter $argv
    end
end