{ pkgs, ... }:

{
environment.systemPackages = with pkgs; [
    fastfetch
    libnotify
    brightnessctl
    playerctl
    ];
}
