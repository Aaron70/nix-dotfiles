{ config, lib, ... } :

let
  editorsCfg = config.homePrograms.editors; 
  cfg = editorsCfg.neovim.nvf.appearance;
in
  with lib;
{
  options.homePrograms.editors.neovim.nvf.appearance = {
    enable = mkEnableOption "Whether to enable the configurations to change the appearance and visual behaviors";
  };

  config = mkIf cfg.enable {
    programs.nvf.settings.vim = {
      theme = { enable = true; name = "tokyonight"; style = "moon"; };

      augroups = [ { name = "highlight-yank"; clear = true; } ];
      autocmds = [
        {
          event = [ "TextYankPost" ];
          desc = "Highlight when yanking (copying) text";
          group = "highlight-yank";
          callback = lib.generators.mkLuaInline ''
            function()
           	  vim.highlight.on_yank()
           	end
          '';
        }
      ];
    };
  };
}
