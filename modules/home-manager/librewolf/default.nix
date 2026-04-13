{ pkgs, ... }:

{
    programs.librewolf = {
        enable = true;
        nativeMessagingHosts = [
            pkgs.tridactyl-native
        ];
        settings = {
            "privacy.resistFingerprinting" = false;
            "browser.toolbars.bookmarks.visibility" = "never";
            "media.eme.enabled" = true;
            "middlemouse.paste" = false;
            "browser.tabs.closeWindowWithLastTab" = false;
            "browser.startup.homepage" = "https://ha.erogig.net?kiosk";
            "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        };
        # https://firefox-admin-docs.mozilla.org/reference/policies
        # ToDo https://github.com/bitbloxhub/nixos-config/blob/4c0aa9afdd878ba5542a7176d8a69e836aa944ac/modules/firefox/darkreader.nix
        policies = {
            ExtensionSettings = {
                "tridactyl.vim@cmcaine.co.uk" = {
                    installation_mode = "normal_installed";
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/tridactyl.vim@cmcaine.co.uk/latest.xpi";
                    default_area = "menupanel";
                    private_browsing = true;
                };
                "FirefoxColor@mozilla.com" = {
                    installation_mode = "normal_installed";
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/FirefoxColor@mozilla.com/latest.xpi";
                    default_area = "menupanel";
                    private_browsing = true;
                };
                "{446900e4-71c2-419f-a6a7-df9c091e268b}" = { # Bitwarden
                    installation_mode = "normal_installed";
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/{446900e4-71c2-419f-a6a7-df9c091e268b}/latest.xpi";
                    default_area = "navbar";
                    private_browsing = true;
                };
            };
            "3rdparty".Extensions = {
                "uBlock0@raymondhill.net".adminSettings = builtins.fromJSON( builtins.readFile ./ublock.txt );
            };
        };
        profiles.default = {
            id = 0;
            extensions.force = true;
        };
    };

    stylix.targets.librewolf = {
        profileNames = [ "default" ];
        colorTheme.enable = true;
    };

    xdg.configFile."tridactyl/tridactylrc" = {
        source = ./tridactylrc;
        force = true;
    };
}
