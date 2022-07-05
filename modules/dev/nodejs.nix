{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.dev.nodejs;
in {
  options.modules.dev.nodejs = { enable = mkEnableOption "nodejs"; };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ nodejs pkgs.nodePackages.pnpm ];
  };
}
