hyprctl reload
#kdeconnect-cli --refresh
killall waybar
hyprctl dispatch exec waybar
hyprctl dispatch -- exec waybar -c /home/erogig/.config/waybar/clock.jsonc -s /home/erogig/.config/waybar/clock.css

killall sway-audio-idle-inhibit
hyprctl dispatch exec sway-audio-idle-inhibit
