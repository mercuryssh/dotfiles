{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.programs.kitty;
in {
  imports = [ ./themes/vitesse-dark-soft.nix];
  options.modules.programs.kitty = { enable = mkEnableOption false; };

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 14;
      };
      settings = {
        cursor_shape = "beam";
        disable_ligatures = "never";
        window_padding_width = "6";
        tab_bar_style = "fade";
        hide_window_decorations = "yes";
        adjust_line_height = "0";
        background_opacity = "0.9";
      };
    };
  };
}
