{ config, lib, ... }:

let
  editorsCfg = config.homePrograms.editors; 
  cfg = editorsCfg.neovim.nvf;
in
  with lib;
{
  options.homePrograms.editors.neovim.nvf = {
    enable = mkEnableOption "Weather to enable Nvf";
  };

  config = mkIf cfg.enable {
    programs.nvf = {

      enable = true;
          
      settings.vim = {
        theme = { enable = true; name = "tokyonight"; style = "moon"; };
        
        options = {
          background = "dark";
          shiftwidth = 2;
          tabstop = 2;
          clipboard = "unnamed";
          mouse = "a";
          undofile = true;
          cursorline = true;
          scrolloff = 10;
        };

        augroups = [ { name = "kickstart-highlight-yank"; clear = true; } ];
        autocmds = import ./autocmds.nix { inherit lib; };
        keymaps = import ./keymaps.nix;
        languages = import ./languages;
        
      } // import ./plugins { inherit lib; };

    };
  };
}
