# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
        efiSupport = true;
        device = "nodev";
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  time.timeZone = "America/Santo_Domingo";
  networking = {
    hostName = "Hoshimachi";
    networkmanager.enable = true;
  };
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
      libinput.enable = true;
    };

    openssh.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [ gcc zsh git neovim wget unzip ];
    binsh = "${pkgs.dash}/bin/dash";
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

  users.users.mash = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    description = "Akiyama Joseph";

    packages = with pkgs; [ firefox kitty vscode chromium ];
  };

  nixpkgs.config.allowUnfree = true;

  nix = { trustedUsers = [ "root" "@wheel" ]; };

  system.stateVersion = "22.05";
}

