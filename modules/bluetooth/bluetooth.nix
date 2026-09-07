{ ... }: {
  flake.nixosModules.bluetooth =
    {
      pkgs,
      ...
    }:
    {
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = false;
      };

      services.blueman.enable = true;

    };

  flake.homeModules.bluetooth =
    {
      pkgs,
      ...
    }:
    {
      services.blueman-applet.enable = true;
      services.mpris-proxy.enable = true;
    };
}
