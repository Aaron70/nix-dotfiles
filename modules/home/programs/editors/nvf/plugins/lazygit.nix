{ config, lib, ... } :

let
  plugin = "lazygit";
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
      terminal.toggleterm = { 
        enable = true; 
      
        lazygit = { 
          enable = true;
          mappings.open = "<leader>lg";
        };
      
        # mappings = {
        #   open = "";
        # };
      };
    };
  };
}
