{
  description = "My NixOS Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; }; # I Failed you rms
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        Hoshimachi = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/Hoshimachi/configuration.nix ];
        };
      };
    };
}
