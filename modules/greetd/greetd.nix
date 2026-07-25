{ ... }: {
  flake.nixosModules.greetd =
    {
      pkgs,
      ...
    }:
    {
      services.greetd = {
        enable = true;
        settings = {
          default_session = {
            command = "start-hyprland";
          };
        };
      };
    };

  flake.homeModules.greetd =
    {
      pkgs,
      ...
    }:
    {

    };
}
