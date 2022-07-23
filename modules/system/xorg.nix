{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    libinput.enable = true;
    displayManager.gdm.enable = true;
    desktopManager = {
      gnome.enable = true;
    };
    excludePackages = [
      pkgs.xterm
    ];
  };
}
