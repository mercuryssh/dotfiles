{ config, pkgs, ... }:

{
  environment = {
    sessionVariables = rec {
      #XDG Base Directory
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";

      # alias variables
      ZDOTDIR = "\${HOME}/.config/zsh";

      PATH = [ "\${XDG_BIN_HOME}" ];
    };

    defaultPackages = [ ];
    binsh = "${pkgs.dash}/bin/dash";
  };
}
