{ ... }: {
  flake.nixosModules.batsignal =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.batsignal =
    {
      pkgs,
      ...
    }:
    {
      services.batsignal = {
        enable = true;
        extraArgs = [
          "-e"
        ];
      };
    };
}
