{ pkgs, ... }:

{
programs.kitty = {
    enable = true;
    inherit (pkgs.kitty);
    };
}
