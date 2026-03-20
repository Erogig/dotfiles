{ inputs, homeManagerModules, ... }: {
  imports = [
    # Import home-manager's NixOS module
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs homeManagerModules; };
    users = {
      # Import your home-manager configuration
      erogig = import ./home.nix;
    };
  };
}
