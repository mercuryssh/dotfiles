{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    #
    ../../modules/system/boot.nix
    ../../modules/system/env.nix
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

