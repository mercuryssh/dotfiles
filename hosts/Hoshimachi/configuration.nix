{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    #
    ../../modules/system/boot.nix
    ../../modules/system/fonts.nix
    ../../modules/system/sound.nix
    ../../modules/system/xorg.nix
  ];

  networking = {
    hostName = "Hoshimachi";
    networkmanager.enable = true;
    dhcpcd.enable = false;
  };

  i18n.defaultLocale = "en_US.UTF-8";

  services.openssh.enable = true;

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
  };

  users.users.mash = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    description = "Akiyama Joseph";
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableGlobalCompInit = false;
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  nix = {
    package = pkgs.nixFlakes;
    trustedUsers = [ "root" "@wheel" ];
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "22.05";
}

