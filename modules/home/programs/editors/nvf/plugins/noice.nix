{ config, lib, ... } :

let
  plugin = "noice";
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
      ui.noice = { 
        enable = true;
        setupOpts = {
          messages = {
            enabled = true;
            view = "notify";
            view_error = "notify";
            view_warn = "notify";
            view_history = "messages"; # view for :messages
            view_search = "virtualtext";
          };
        };
      };
    };
  };
}
