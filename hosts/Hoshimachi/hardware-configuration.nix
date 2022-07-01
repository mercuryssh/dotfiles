{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/" = {
    device = "/dev/sda6";
    fsType = "btrfs";
    options = [ "subvol=@" "compress=zstd" "noatime" ];
  };

  fileSystems."/home" = {
    device = "/dev/sda6";
    fsType = "btrfs";
    options = [ "subvol=@home" "compress=zstd" "noatime" ];
  };

  fileSystems."/nix" = {
    device = "/dev/sda6";
    fsType = "btrfs";
    options = [ "subvol=@nix" "compress=zstd" "noatime" ];
  };

  fileSystems."/tmp" = {
    device = "/dev/sda6";
    fsType = "btrfs";
    options = [ "subvol=@tmp" "compress=zstd" "noatime" ];
  };

  fileSystems."/var" = {
    device = "/dev/sda6";
    fsType = "btrfs";
    options = [ "subvol=@var" "compress=zstd" "noatime" ];
  };

  fileSystems."/opt" = {
    device = "/dev/sda6";
    fsType = "btrfs";
    options = [ "subvol=@opt" "compress=zstd" "noatime" ];
  };

  fileSystems."/var/swap" = {
    device = "/dev/sda6";
    fsType = "btrfs";
    options = [ "subvol=@swap" "compress=zstd" "noatime" ];
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/E488-A422";
    fsType = "vfat";
  };

  swapDevices = [{
    device = "/var/swap/swapfile";
    size = 4444;
  }];

  networking.useDHCP = lib.mkDefault true;
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.video.hidpi.enable = lib.mkDefault true;
}
