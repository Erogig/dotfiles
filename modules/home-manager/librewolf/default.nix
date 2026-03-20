{ pkgs, ... }:

{
    programs.librewolf = {
        enable = true;
        settings = {
            "privacy.resistFingerprinting" = false;
            "browser.toolbars.bookmarks.visibility" = "never";
            "media.eme.enabled" = true;
            "middlemouse.paste" = false;
            "browser.tabs.closeWindowWithLastTab" = false;
            "browser.startup.homepage" = "https://ha.erogig.net?kiosk";
            "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        };
        # https://mozilla.github.io/policy-templates/#extensionsettings
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
    home.packages = [ pkgs.tridactyl-native ];
}
