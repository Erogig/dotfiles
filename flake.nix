{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        stylix = {
            url = "github:nix-community/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    };

    outputs = { self, nixpkgs, home-manager, stylix, nixos-hardware, ... }@inputs: {
        # use "nixos", or your hostname as the name of the configuration
        # it's a better practice than "default" shown in the video
        nixosModules = import ./modules/nixos;
        homeManagerModules = import ./modules/home-manager;

        nixosConfigurations.sidhe = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs; nixMods = self.nixosModules; homeMods = self.homeManagerModules; };
            modules = [
                stylix.nixosModules.stylix
                ./nixos/configuration.nix
                nixos-hardware.nixosModules.dell-xps-15-9530-nvidia
            ];
        };
    };
}
