{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.dev.python;
in {
  options.modules.dev.python = { enable = mkEnableOption "python"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ python310 python310Packages.pip pipenv ];
  };
}
