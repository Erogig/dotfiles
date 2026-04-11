{ ... }:

let
    portRange = [
        {
            from = 1714;
            to = 1764;
        }
    ];
in
{
    networking.networkmanager.enable = true;

    networking.firewall.interfaces = {
        Home.allowedUDPPortRanges = portRange;
        Home.allowedTCPPortRanges = portRange;
        Sweden.allowedUDPPortRanges = portRange;
        Sweden.allowedTCPPortRanges = portRange;
        Switzerland.allowedUDPPortRanges = portRange;
        Switzerland.allowedTCPPortRanges = portRange;
    };
}
