{ lib, ... }:
    
[
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
]

