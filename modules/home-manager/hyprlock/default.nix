{ ... }:

{
    stylix.targets.hyprlock.image.enable = false;

    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                ignore_empty_input = true;
            };

            auth = {
                "fingerprint:enabled" = true;
            };

            background = {
                path = "screenshot";
                blur_size = 5;
                blur_passes = 1;
                noise = 0.0117;
                brightness = 0.4;
                vibrancy = 0.21;
                vibrancy_darkness = 0;
            };

            input-field = {
                size = "250, 50";
                outline_thickness = 3;
                dots_size = 0.33;

                fade_timeout = 1000;

                placeholder_text = "<i>...</i>";

                position = "0, -100";
            };

            label = [
                {
                    text = "cmd[update:1000] echo \"<b><big> $(date +\"%H:%M:%S\") </big></b>\"";
                    font_size = 94;
                }
                {
                    text = "   $USER";
                    font_size = 18;
                    position = "0, 100";
                    valign = "bottom";
                }
            ];
        };
    };

}
