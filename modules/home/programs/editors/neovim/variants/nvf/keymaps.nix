{ config, lib, ... } :

let
  cfg = config.programs.home.neovim.nvf.keymaps;
in
  with lib;
{
  options.programs.home.neovim.nvf.keymaps = {
    enable = mkEnableOption "Whether to enable the custom Keymaps";
  };

  config = mkIf cfg.enable {
    programs.nvf.settings.vim.keymaps = [
      #==============================Others==============================#
      { mode = [ "i" ]; key = "jk"; action = "<esc>"; }
      { key = "<Esc>"; action = "<cmd>nohlsearch<CR>"; mode = [ "n" ]; }
      #==============================Others==============================#
    
      #==============================Clipboard==============================#
      { key = "<leader>y"; action = "\"+y"; mode = [ "v" ]; desc = "[Y]ank to clipboard"; }
      { key = "<leader>yy"; action = "\"+yy"; mode = [ "n" ]; desc = "[Y]ank line to clipboard"; }
      { key = "<leader>p"; action = "\"+p"; mode = [ "n" "v" ]; desc = "[P]aste from clipboard"; }
      { key = "<leader>P"; action = "\"+P"; mode = [ "n" "v" ]; desc = "[P]aste from clipboard (Before)"; }
      #==============================Clipboard==============================#
    
    
    
      #==============================Movement==============================#
      { key = "<C-h>"; action = "<C-w><C-h>"; mode = [ "n" ]; desc = "Move focus to the left pane"; }
      { key = "<C-l>"; action = "<C-w><C-l>"; mode = [ "n" ]; desc = "Move focus to the right pane"; }
      { key = "<C-j>"; action = "<C-w><C-j>"; mode = [ "n" ]; desc = "Move focus to the down pane"; }
      { key = "<C-k>"; action = "<C-w><C-k>"; mode = [ "n" ]; desc = "Move focus to the up pane"; }
      #==============================Movement==============================#
    
    
      # Plugins keymaps
    
      #==============================Neotree==============================#
      { mode = [ "n" ]; key = "\\"; action = ":Neotree reveal<CR>"; silent = true; }
      #==============================Neotree==============================#
    ];
  };
}
