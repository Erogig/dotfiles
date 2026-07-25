{ ... }: {
  flake.nixosModules.bootloader =
    {
      pkgs,
      ...
    }:
    {
      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };

  flake.homeModules.bootloader =
    {
      pkgs,
      ...
    }:
    {

    };
}
