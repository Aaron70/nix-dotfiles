{ lib, ... }:

{
  programs.nvf.settings.vim = {
    augroups = [
      { name = "kickstart-highlight-yank"; clear = true; }
    ];
    autocmds = [
      {
        event = [ "TextYankPost" ];
        desc = "Highlight when yanking (copying) text";
        group = "kickstart-highlight-yank";
        callback = lib.generators.mkLuaInline ''
          function()
         	  vim.highlight.on_yank()
         	end
        '';
      }
    ];
  };
}

