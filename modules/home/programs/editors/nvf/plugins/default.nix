{ config, lib, myLib, ... } :

let
  editorsCfg = config.homePrograms.editors; 
  cfg = editorsCfg.neovim.nvf.plugins;
in
  with lib;
{
  imports = myLib.importAll ./. "default.nix";

  options.homePrograms.editors.neovim.nvf.plugins = {
    enable = mkEnableOption "Whether to enable all the plugins";
  };

  config = mkIf cfg.enable {
    homePrograms.editors.neovim.nvf.plugins = {
      blink-cmp.enable = true;
      hop.enable = true;
      lazygit.enable = true;
      lsp.enable = true;
      neo-tree.enable = true;
      noice.enable = true;
      telescope.enable = true;
      chatgpt.enable = true;
    };

    programs.nvf.settings.vim = {
      statusline.lualine.enable = true;
      spellcheck.enable = true;
      notes.todo-comments.enable = true;
    };
  };
}
