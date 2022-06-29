{
  description = "My NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; }; # I Failed you rms
      };
    in {
      homeConfigurations = {
        mash = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./modules/programs
            {
              home = {
                username = "mash";
                homeDirectory = "/home/mash";
                stateVersion = "22.05";
              };
            }
          ];
        };

      };

      nixosConfigurations = {
        Hoshimachi = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/Hoshimachi/configuration.nix ];
        };
      };

    };
}
