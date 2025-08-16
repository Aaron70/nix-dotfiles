{ config, lib, ... } :

let
  editorsCfg = config.homePrograms.editors; 
  cfg = editorsCfg.neovim.nvf.options;
in
  with lib;
{
  options.homePrograms.editors.neovim.nvf.options = {
    enable = mkEnableOption "Whether to enable the custom options";
  };

  config = mkIf cfg.enable {
    programs.nvf.settings.vim.options = {
      background = "dark";
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      clipboard = "unnamed";
      mouse = "a";
      undofile = true;
      cursorline = true;
      scrolloff = 10;
    };
  };
}
