{ config, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    cascadia-code
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "CascadiaCode" "JetBrainsMono" "Iosevka" "Mononoki" ]; })
  ];

  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "CascadiaCode" ];
      sansSerif = [ "CascadiaCode" ];
      serif = [ "CascadiaCode" ];
      emoji = [ "Noto Fonts Emoji" ];
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}
