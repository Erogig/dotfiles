{ ... }:

{
    networking.wireguard = {
        enable = true;
    };

    networking.wg-quick = {
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
}
