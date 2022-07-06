{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      gcc
      zsh
      git
      neovim
      wget
      unzip
      gnome.gnome-tweaks
    ];
    defaultPackages = [ ];
    gnome.excludePackages = [
      pkgs.gnome.cheese
      pkgs.gnome-photos
      pkgs.gnome.gnome-music
      pkgs.gnome.gedit
      pkgs.epiphany
      pkgs.evince
      pkgs.gnome.gnome-characters
      pkgs.gnome.totem
      pkgs.gnome.tali
      pkgs.gnome.iagno
      pkgs.gnome.hitori
      pkgs.gnome.atomix
      pkgs.gnome-tour
    ];
    binsh = "${pkgs.dash}/bin/dash";
    sessionVariables = rec {
      #XDG Base Directory
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";

      # alias variables
      ZDOTDIR = "\${HOME}/.config/zsh";

      PATH = [ "\${XDG_BIN_HOME}" ];
    };
  };
}
