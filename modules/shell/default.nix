{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [ neofetch ];

  programs = {
    starship = {
      enable = true;
      settings.character.success_symbol = "[➜](bold green)";

      settings.character.error_symbol = "[➜](bold red)";
    };

    git = {
      enable = true;
      userName = "joseph Estevez";
      userEmail = "joseph.estevez@protonmail.com";

      signing = {
        key = "joseph.estevez@protonmail.com";
        signByDefault = true;
      };

      extraConfig = {
        core.editor = "nvim";
      };
    };
  };

  home.file = {
    ".config/neofetch".source =
      config.lib.file.mkOutOfStoreSymlink ../../config/neofetch;
  };
}
