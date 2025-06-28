{ config, lib, ... } :

let
  plugin = "hop";
  editorsCfg = config.homePrograms.editors; 
  cfg = editorsCfg.neovim.nvf.plugins.${plugin};
in
  with lib;
{
  options.homePrograms.editors.neovim.nvf.plugins.${plugin} = {
    enable = mkEnableOption "Whether to enable all the plugin ${plugin}";
  };

  config = mkIf cfg.enable {
    programs.nvf.settings.vim.keymaps = [
      {  
        key = "f"; mode = ""; lua = true; action = ''function()
          require("hop").hint_char1 { direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true }
        end'';
      }
      {  
        key = "F"; mode = ""; lua = true; action = ''function()
          require("hop").hint_char1 { direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true }
        end'';
      }
      {  
        key = "t"; mode = ""; lua = true; action = ''function()
          require("hop").hint_char1 { direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
        end'';
      }
      {  
        key = "T"; mode = ""; lua = true; action = ''function()
          require("hop").hint_char1 { direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
        end'';
      }
      {  
        desc = "Hop to pattern, after cursor";
        key = "<leader>/"; mode = ""; lua = true; action = ''function()
          require("hop").hint_patterns {}
        end'';
      }
      {  
        desc = "Hop to pattern, before cursor";
        key = "<leader>?"; mode = ""; lua = true; action = ''function()
          require("hop").hint_patterns { direction = require('hop.hint').HintDirection.BEFORE_CURSOR }
        end'';
      }
      {  
        desc = "Hop to word";
        key = "<leader>w"; mode = ""; lua = true; action = ''function()
          require("hop").hint_words {}
        end'';
      }
      {  
        desc = "Hop to char";
        key = "<leader>c"; mode = ""; lua = true; action = ''function()
          require("hop").hint_char1 {}
        end'';
      }
    ];
    programs.nvf.settings.vim = {
      utility.motion.hop = {
        enable = true;
      };
    };
  };
}
