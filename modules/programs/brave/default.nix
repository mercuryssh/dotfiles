{ config, options, lib, pkgs, ... }:

with lib;
let cfg = config.modules.programs.brave;
in
{
  options.modules.programs.brave = {
    enable = mkEnableOption false;
  };

  config = mkIf cfg.enable {
    programs.brave.enable = true;
  };
}
