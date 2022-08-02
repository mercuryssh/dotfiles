{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.programs.neovim;
in
{
  options.modules.programs.neovim = {
    enable = mkEnableOption false;
  };

  config = mkIf cfg.enable
    {
      programs.neovim = {
        enable = true;

        extraConfig = ''
          set background=dark
          set clipboard=unnamedplus
          set completeopt=noinsert,menuone,noselect
          set relativenumber
          set splitbelow splitright
          set title
          set ttimeoutlen=0
          set wildmenu
          set expandtab
          set shiftwidth=2
          set tabstop=2
        '';
      };
    };
}

