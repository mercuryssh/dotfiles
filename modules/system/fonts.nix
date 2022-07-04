{ config, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" "Mononoki" ]; })
  ];

  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "JetBrainsMono Nerd Font" ];
      serif = [ "JetBrainsMono Nerd Font" ];
      emoji = [ "Noto Fonts Emoji" ];
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}
