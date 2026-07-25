{ ... }: {
  flake.nixosModules.wireguard = {
    pkgs,
    ...
  }:
  let
    KDEconnectPortRange = [
      {
        from = 1714;
        to = 1764;
      }
    ];
  in
  {
    networking = {
      wireguard.enable = true;
      wg-quick = {
        interfaces = {
          Home = {
            configFile = "/secrets/vpn/Sidhe_Home.conf";
            autostart = false;
          };
          Sweden = {
            configFile = "/secrets/vpn/Sidhe_Sweden.conf";
            autostart = true;
          };
          Switzerland = {
            configFile = "/secrets/vpn/Sidhe_Switzerland.conf";
            autostart = false;
          };
          Esek = {
            configFile = "/secrets/vpn/Sidhe_Esek.conf";
            autostart = false;
          };
        };
      };

      firewall.interfaces = {
        Home.allowedUDPPortRanges = KDEconnectPortRange;
        Home.allowedTCPPortRanges = KDEconnectPortRange;
        Sweden.allowedUDPPortRanges = KDEconnectPortRange;
        Sweden.allowedTCPPortRanges = KDEconnectPortRange;
        Switzerland.allowedUDPPortRanges = KDEconnectPortRange;
        Switzerland.allowedTCPPortRanges = KDEconnectPortRange;
      };
    };
  };

  flake.homeModules.wireguard = {
    pkgs,
    ...
  }: {
    
  };
}
