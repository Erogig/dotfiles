{ pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        syshud
    ];

    systemd.user.services.syshud = {
        Unit = {
            Description = "syshud daemon";
            PartOf = [ "graphical-session.target" ];
            After = [ "graphical-session.target" ];
        };

        Service = {
            Type = "exec";
            ExecStart = "${lib.getExe pkgs.syshud}";
            Restart = "always";
        };

        Install.WantedBy = [ "graphical-session.target" ];
    };
}
