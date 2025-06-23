{
  description = "NixOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.shadowpad = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/shadowpad/configuration.nix

          home-manager.nixosModules.home-manager

          {
            nixpkgs.config.allowUnfree = true;
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;

            # Don't import home.nix here
            # Just enable home-manager in system config
          }
        ];
      };
      homeConfigurations.shadow = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
         modules = [ ./home/shadow/home.nix ];
         extraSpecialArgs = { inherit system; };
        };

      };
}
