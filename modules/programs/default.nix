{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ nodejs pkgs.nodePackages.pnpm ];

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
