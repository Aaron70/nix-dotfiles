{ config, lib, ... } :

let
  plugin = "telescope";
  editorsCfg = config.homePrograms.editors; 
  cfg = editorsCfg.neovim.nvf.plugins.${plugin};
in
  with lib;
{
  options.homePrograms.editors.neovim.nvf.plugins.${plugin} = {
    enable = mkEnableOption "Whether to enable all the plugin ${plugin}";
  };

  config = mkIf cfg.enable {
    programs.nvf.settings.vim = {
      telescope = { 
        enable = true;
    
        mappings = {
          lspDefinitions = "gd";
          lspTypeDefinitions = "<leader>gT";
          lspImplementations = "gI";
          lspReferences = "gr";
        };
    
        setupOpts = {
          defaults = {
            path_display = [ "smart" ];
          };
    
    
        };
      };
    };
  };
}
