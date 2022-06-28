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
      username = "mash";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; }; # I Failed you rms
      };
    in {
      homeConfigurations.${username} =
        home-manager.lib.homeManagerConfiguration {
          inherit system username pkgs;
          stateVersion = "22.05";
          homeDirectory = "/home/${username}";

          configuration = { pkgs, config, ... }: {
            imports = [ ./hosts/Hoshimachi/home.nix ];
            programs.home-manager.enable = true;
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
