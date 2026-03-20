{ ... }:

{
    services.easyeffects = {
        enable = true;
        extraPresets = {
            G433 = builtins.fromJSON (builtins.readFile ./G433.json);
            XPS15 = builtins.fromJSON (builtins.readFile ./xps15.json);
            Moondrop_chu_2 = builtins.fromJSON (builtins.readFile ./Moondrop_chu_2.json);
        };
        preset = "XPS15";
    };
}
