{ config, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      cascadia-code
      jetbrains-mono
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override { fonts = [ "CascadiaCode" "JetBrainsMono" "Mononoki" ]; })
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "CaskaydiaCove Nerd Font Mono" ];
        sansSerif = [ "CaskaydiaCove Nerd Font" ];
        serif = [ "CaskaydiaCove Nerd Font" ];
        emoji = [ "Noto Fonts Emoji" ];
      };
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}
