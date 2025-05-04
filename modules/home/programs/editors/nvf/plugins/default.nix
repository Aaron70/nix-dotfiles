with builtins;
  let 
    files = filter (name: name != "default.nix") (attrNames (readDir ./.));
    pluginsSet = map (file: import ./${file}) files;
    plugins = {
      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.blink-cmp.enable = true;
      spellcheck.enable = true;
    };
  in
    foldl' (acc: elem: acc // elem) plugins pluginsSet 
