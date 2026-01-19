function git
    if contains "fetch" $argv || contains "pull" $argv || contains "push" $argv 
        switch $PWD
            case contains "$HOME/anka"
                gh auth switch --user LTHankor &>/dev/null 
            case '*'
                gh auth switch --user Erogig &>/dev/null
        end
    end
    command git $argv
end
