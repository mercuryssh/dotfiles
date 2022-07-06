{ config, pkgs, libs, ... }:

{
  programs.kitty.settings = {
    # 🏕️ Vitesse dark soft.
    foreground = "#dbd7ca";
    background = "#222222";
    selection_foreground = "#dbd7ca";
    selection_background = "#292929";
    url_color = "#4d9375";
    cursor = "#111212";

    # black
    color0 = "#393a34";
    color8 = "#393a34";

    # red
    color1 = "#393a34";
    color9 = "#393a34";

    # green
    color2 = "#4d9375";
    color10 = "#4d9375";

    # yellow
    color3 = "#e6cc77";
    color11 = "#e6cc77";

    # blue
    color4 = "#6394bf";
    color12 = "#6394bf";

    # magenta
    color5 = "#d9739f";
    color13 = "#d9739f";

    # cyan
    color6 = "#5eaab5";
    color14 = "#5eaab5";

    # white
    color7 = "#d3d7cf";
    color15 = "#d3d7cf";
  };
}
