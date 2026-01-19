{ inputs, homeMods, ... }: {
  imports = [
    # Import home-manager's NixOS module
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs homeMods; };
    users = {
      # Import your home-manager configuration
      erogig = import ./home.nix;
    };
  };
}
