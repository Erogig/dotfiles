{ ... }: {
  flake.nixosModules.mpd = {
    pkgs,
    ...
  }: {
    
  };

  flake.homeModules.mpd = {
    pkgs,
    config,
    ...
  }: {
    services.mpd = {
      enable = true;
      musicDirectory = "${config.home.homeDirectory}/Music";
      playlistDirectory = ./playlists;
      extraConfig = ''
        audio_output {
          type "pulse"
          name "MPD"
        }'';
    };

    services.mpd-mpris = {
      enable = true;
    };
  };
}
