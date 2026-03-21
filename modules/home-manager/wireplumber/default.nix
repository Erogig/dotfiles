{ config, ... }:

{
    home.file.".local/state/wireplumber/default-profile" = {
        source = ./default-profile;
        force = true;
    };
}
