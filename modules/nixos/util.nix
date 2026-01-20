{ pkgs, ... }:

{
environment.systemPackages = [
    pkgs.killall
    pkgs.fastfetch
    pkgs.libnotify
    ];
}
