[
  { mode = [ "i" ]; key = "jk"; action = "<esc>"; }

  #==============================Clipboard==============================#
  { key = "<leader>y"; action = "\"+y"; mode = [ "v" ]; desc = "[Y]ank to clipboard"; }
  { key = "<leader>yy"; action = "\"+yy"; mode = [ "n" ]; desc = "[Y]ank line to clipboard"; }
  { key = "<leader>p"; action = "\"+p"; mode = [ "n" "v" ]; desc = "[P]aste from clipboard"; }
  { key = "<leader>P"; action = "\"+P"; mode = [ "n" "v" ]; desc = "[P]aste from clipboard (Before)"; }
  #=key = =============================Clipboard==============================#



  # Plugins keymaps

  #==============================Neotree==============================#
  { mode = [ "n" ]; key = "\\"; action = ":Neotree reveal<CR>"; silent = true; }
  #==============================Neotree==============================#
]
