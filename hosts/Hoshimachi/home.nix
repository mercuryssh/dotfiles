{ config, pkgs, lib, ... }:

{
  imports = [ ../../modules/dev/python.nix ];

  home = {
    username = "mash";
    homeDirectory = "/home/mash";
    stateVersion = "22.05";

    packages = with pkgs; [
      nodejs
      pkgs.nodePackages.pnpm
      kitty
      vscode
      gimp
      papirus-icon-theme
    ];
  };
  
  modules = { dev = { python.enable = true; }; };

  programs = {
    home-manager.enable = true;
    htop.enable = true;
    emacs.enable = true;
    google-chrome.enable = true;

    git = {
      enable = true;
      userName = "joseph Estevez";
      userEmail = "joseph.estevez@protonmail.com";
    };
  };
}
