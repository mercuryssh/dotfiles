{ config, pkgs, ... }:

{
  home = {
    username = "mash";
    homeDirectory = "/home/mash";
    stateVersion = "22.05";

    packages = with pkgs; [
      nodejs
      pkgs.nodePackages.pnpm
      python
      gnupg
      firefox
      kitty
      vscode
      gimp
    ];
  };

  programs = {
    home-manager.enable = true;
    htop.enable = true;
    emacs.enable = true;
    vivaldi.enable = true;

    git = {
      enable = true;
      userName = "joseph Estevez";
      userEmail = "joseph.estevez@protonmail.com";
    };
  };
}
