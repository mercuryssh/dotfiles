{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    libinput.enable = true;
    displayManager.gdm.enable = true;
    desktopManager = {
      xterm.enable = false;
      gnome.enable = true;
    };
  };
}
