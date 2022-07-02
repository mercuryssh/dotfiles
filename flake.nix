{
  description = "My NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true; # I Failed you rms
        };
      };
    in {
      nixosConfigurations = {
        Hoshimachi = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/Hoshimachi/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.mash = import ./hosts/Hoshimachi/home.nix;
            }
          ];
        };
      };

    };
}
