args:

with builtins;
  let 
    files = filter (name: name != "default.nix") (attrNames (readDir ./.));
    pluginsSet = map (file: import ./${file} args) files;
    plugins = {
      statusline.lualine.enable = true;
      telescope.enable = true;
      spellcheck.enable = true;
      notes.todo-comments.enable = true;
    };
  in
    foldl' (acc: elem: acc // elem) plugins pluginsSet 
