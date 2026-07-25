{ ... }: {
  flake.nixosModules.audio =
    {
      pkgs,
      ...
    }:
    {
      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    };

  flake.homeModules.audio =
    {
      pkgs,
      ...
    }:
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

      home.file.".local/state/wireplumber/default-profile" = {
        source = ./default-profile;
        force = true;
      };
    };
}
