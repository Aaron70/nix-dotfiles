{ ... }:

{
  imports = [ ./autocmds.nix ];
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

      keymaps = import ./keymaps.nix;
      languages = import ./languages;
      
    } // import ./plugins;
  };
}
