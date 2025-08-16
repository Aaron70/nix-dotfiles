{ config, lib, ... } :

let
  plugin = "blink-cmp";
  editorsCfg = config.homePrograms.editors; 
  cfg = editorsCfg.neovim.nvf.plugins.${plugin};
in
  with lib;
{
  options.homePrograms.editors.neovim.nvf.plugins.${plugin} = {
    enable = mkEnableOption "Whether to enable the plugin ${plugin}";
  };

  config = mkIf cfg.enable {
    programs.nvf.settings.vim = {
      autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
        setupOpts = {
          keymap = {
            preset = "default";
            "<CR>" = [ "accept" "fallback" ];
          };
        };
      };
    };
  };
}
