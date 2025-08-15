{ config, lib, ... } :

let
  plugin = "nvim-dap";
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
      debugger.nvim-dap = { 
        enable = true;
        ui = {
          enable = true;
        };
      };
    };
  };
}
