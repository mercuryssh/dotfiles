{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules.programs.vscode;
  vscode = (pkgs.vscode.override { isInsiders = false; }).overrideAttrs (oldAttrs: rec {
    src = (builtins.fetchTarball {
      url = "https://update.code.visualstudio.com/1.70.1/linux-x64/stable";
      sha256 = "0fay23spha42rhbdd69bpl6h22vqg3aj7hhnld6gxfhv8z1scnsz";
    });
  });
in
{
  options.modules.programs.vscode = { enable = mkEnableOption false; };

  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = vscode;
    };

    home.file.".config/Code/Keqing_1.webp".source = ../../../assets/icons/Keqing_1.webp;
  };
}
