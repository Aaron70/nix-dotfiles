{ config, lib, ... } :

let
  editorsCfg = config.homePrograms.editors; 
  cfg = editorsCfg.neovim.nvf.plugins.treesitter.context;
in
  with lib;
{
  options.homePrograms.editors.neovim.nvf.plugins.treesitter.context = {
    enable = mkEnableOption "Whether to enable all the plugin treesitter.context";
  };

  config = mkIf cfg.enable {
    programs.nvf.settings.vim = {
      treesitter.context = {
        enable = true;
        setupOpts = {
          separator = null;
        };
      };
    };
  };
}
