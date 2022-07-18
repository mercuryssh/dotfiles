{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.programs.vscode;
in
{
  options.modules.programs.vscode = { enable = mkEnableOption false; };

  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      # package = pkgs.vscodium;

      # just the basics, the rest I load from the vscode sync the basic 
      extensions = with pkgs.vscode-extensions; [
        file-icons.file-icons
        jnoortheen.nix-ide
        vscodevim.vim
      ];

      userSettings = {
        # Disable Telemetry
        "telemetry.telemetryLevel" = "off";
        "redhat.telemetry.enabled" = false;

        # Git
        "git.enableCommitSigning" = true;

        # Text
        "editor.tabSize" = 2;
        "editor.fontFamily" = "system-ui";
        "editor.fontSize" = 17;
        "editor.fontLigatures" = true;

        # Layout
        "window.dialogStyle" = "custom";
        "window.titleBarStyle" = "custom";
        "editor.minimap.enabled" = false;
        "breadcrumbs.enabled" = false;

        # workbench
        "workbench.editor.enablePreview" = false;
        "workbench.colorTheme" = "Vitesse Dark";
        "workbench.iconTheme" = "file-icons";
        "workbench.productIconTheme" = "icons-carbon";
        "workbench.startupEditor" = "none";
        "workbench.colorCustomizations" = {
          "editor.lineHighlightBackground" = "#00000000";
        };

        # Languages preference
        "javascript.preferences.quoteStyle" = "single";
        "typescript.preferences.quoteStyle" = "single";
        "typescript.tsdk" = "node_modules/typescript/lib";
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[yaml]" = { "editor.defaultFormatter" = "redhat.vscode-yaml"; };
        "[html]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
        "[css]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
        "[scss]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
        "[json]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
        "[jsonc]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };

        # excludes Files
        "files.exclude" = {
          "**/node_modules" = true;
          "**/dist" = true;
          "**/.next" = true;
        };

        # Updates
        "update.mode" = "manual";

        /* Background Image */
        "background.enabled" = true;
        "background.loop" = false;
        "background.useDefault" = false;
        "background.useFront" = false;
        "background.customImages" = [
          "/home/mash/Pictures/Icons/Hu_Tao_Reciting_poetry.webp"
        ];
        "background.style" = {
          "height" = "100%";
          "z-index" = "4444";
          "margin-left" = "60%";
          "margin-top" = "10%";
          "background-position" = "absolute";
          "background-repeat" = "no-repeat";
          "background-size" = "200px";
          "opacity" = 0.8;
        };
      };
    };
  };
}
