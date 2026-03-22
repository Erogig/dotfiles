{ pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        sway-audio-idle-inhibit
    ];

    systemd.user.services.sway-audio-idle-inhibit = {
        Unit = {
            Description = "SwayAudioIdleInhibit daemon";
            Documentation = [ "https://github.com/ErikReider/SwayAudioIdleInhibit" ];
            PartOf = [ "graphical-session.target" ];
            After = [ "graphical-session.target" ];
            # ConditionEnvironment requires systemd v247 to work correctly
            ConditionEnvironment = "WAYLAND_DISPLAY";
        };

        Service = {
            Type = "simple";
            ExecStart = "${lib.getExe pkgs.sway-audio-idle-inhibit}";
            Restart = "on-failure";
        };

        Install = {
            WantedBy = [ "graphical-session.target" ];
        };
    };
}
