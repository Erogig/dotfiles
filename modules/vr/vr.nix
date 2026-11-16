{ ... }: {
  flake.nixosModules.vr =
    {
      pkgs,
      ...
    }:
    {
      services.monado = {
        enable = true;
        defaultRuntime = true;
      };

      systemd.user.services.monado.environment = {
        STEAMVR_LH_ENABLE = "1";
        XRT_COMPOSITOR_COMPUTE = "1";
        IPC_EXIT_WHEN_IDLE = "1";
        WMR_HANDTRACKING = "0";
        LH_HANDTRACKING = "OFF";
        # XRT_COMPOSITOR_FORCE_NVIDIA_DISPLAY="NVIDIA";
        # XRT_COMPOSITOR_FORCE_WAYLAND_DIRECT="1";
        # XRT_COMPOSITOR_FORCE_GPU_INDEX = "0"; # force intel gpu
      };

      programs.steam.package = pkgs.steam.override {
        extraProfile = ''
          # Allows Monado/WiVRn to be used
          export PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES=1
          # Fixes timezones on VRChat
          unset TZ
        '';
      };

      systemd.user.services.wayvr = {
        description = "WayVR desktop overlay for OpenXR/OpenVR";
        partOf = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        wantedBy = [ "graphical-session.target" ];
        serviceConfig = {
          ExecStart = "${pkgs.wayvr}/bin/wayvr --replace";
          Restart = "on-failure";
        };
      };
    };

  flake.homeModules.vr =
    {
      pkgs,
      config,
      ...
    }:
    {
      xdg.configFile."openxr/1/active_runtime.json".source =
        "${pkgs.monado}/share/openxr/1/openxr_monado.json";

      xdg.configFile."openvr/openvrpaths.vrpath".text =
        let
          steam = "${config.xdg.dataHome}/Steam";
        in
        builtins.toJSON {
          version = 1;
          jsonid = "vrpathreg";

          external_drivers = null;
          config = [ "${steam}/config" ];

          log = [ "${steam}/logs" ];

          runtime = [
            "${pkgs.xrizer}/lib/xrizer"
            # OR
            #"${pkgs.opencomposite}/lib/opencomposite"
            # OR (using nixpkgs-xr)
            # "${pkgs.vapor}/lib/VapoR"
          ];
        };
    };
}
