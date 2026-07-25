function fakefetch --wraps='fastfetch --logo fedora' --description 'alias fakefetch=fastfetch --logo fedora'
    fastfetch --logo fedora $argv
end
