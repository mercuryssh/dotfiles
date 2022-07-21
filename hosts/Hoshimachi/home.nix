{ config, pkgs, lib, ... }:

{
  imports = [
    ../../modules/shell
    ../../modules/programs/kitty
    ../../modules/programs/vscode
    ../../modules/programs/brave
    ../../modules/dev/nodejs.nix
    ../../modules/dev/python.nix
  ];

  home = {
    username = "mash";
    homeDirectory = "/home/mash";
    stateVersion = "22.05";

    packages = with pkgs; [ kitty gimp papirus-icon-theme gtypist osu-lazer spotify ];
  };

  modules = {
    dev = {
      python.enable = true;
      nodejs.enable = true;
    };
    programs = {
      kitty.enable = true;
      vscode.enable = true;
      brave.enable = true;
    };
  };

  programs = {
    home-manager.enable = true;
    emacs.enable = true;
    google-chrome.enable = true;
  };
}
