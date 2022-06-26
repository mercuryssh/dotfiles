{ config, pkgs, ... }:

{
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
