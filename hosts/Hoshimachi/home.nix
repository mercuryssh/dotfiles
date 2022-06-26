{ config, pkgs, ... }:

{
  home.packages = [ pkgs.nodejs pkgs.nodePackages.pnpm ];

  programs = {
    htop.enable = true;
    emacs.enable = true;

    git = {
      enable = true;
      userName = "joseph Estevez";
      userEmail = "joseph.estevez@protonmail.com";
    };
  };
}
