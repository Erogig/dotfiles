{ ... }:

{
    services.hypridle = {
        enable = true;
        settings = {
            general = {
                lock_cmd = "pidof hyprlock || hyprlock --grace 5";
                unlock_cmd = "pkill -USR1 hyprlock";
                before_sleep_cmd = "pidof hyprlock || hyprlock";
                after_sleep_cmd = "hyprctl dispatch dpms on";
            };

            listener = [
                {
                    timeout = 270;
                    on-timeout = "notify-send \"Your are idle!\"";
                }
                {
                    timeout = 300;
                    on-timeout = "pidof hyprlock || hyprlock --grace 5";
                }
            ];
        };
    };
}
