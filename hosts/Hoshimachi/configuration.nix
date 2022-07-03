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
    dhcpcd.enable = false;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      libinput.enable = true;
      displayManager.gdm.enable = true;
      desktopManager = {
        xterm.enable = false;
        gnome.enable = true;
      };
    };
    openssh.enable = true;
  };

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

  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nixFlakes;
    trustedUsers = [ "root" "@wheel" ];
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "22.05";
}

