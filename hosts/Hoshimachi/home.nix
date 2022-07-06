{ config, pkgs, lib, ... }:

{
  imports = [
    ../../modules/shell
    ../../modules/programs/kitty
    ../../modules/dev/nodejs.nix
    ../../modules/dev/python.nix
  ];

  home = {
    username = "mash";
    homeDirectory = "/home/mash";
    stateVersion = "22.05";

    packages = with pkgs; [ kitty vscode gimp papirus-icon-theme ];
  };

  modules = {
    dev = {
      python.enable = true;
      nodejs.enable = true;
    };
    programs = { kitty.enable = true; };
  };

  programs = {
    home-manager.enable = true;
    htop.enable = true;
    emacs.enable = true;
    google-chrome.enable = true;
  };
}
