{ config, lib, ... } :

let
  plugin = "neo-tree";
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
      filetree.neo-tree = { 
        enable = true;
    
        setupOpts = {
          filesystem = {
            window = {
              position = "right";
              mappings = {
                "\\" = "close_window"; 
              };
            };
          };
    
          event_handlers = [
            {
              event = "file_opened";
              handler = lib.generators.mkLuaInline ''function(arg)
                require "neo-tree.command".execute({
                  action = "close"
                })
              end'';
            }
          ];
        };
      };
    };
  };
}
