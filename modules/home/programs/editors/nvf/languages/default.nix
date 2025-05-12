with builtins;
  let 
    files = filter (name: name != "default.nix") (attrNames (readDir ./.));
    configsSet = map (file: import ./${file}) files;
    config = {
      enableFormat = false;
      enableTreesitter = true;
      enableDAP = true;

      nix.enable = true;
      go.enable = true;
      java.enable = true;
      lua.enable = true;
      python.enable = true;
      ts.enable = true;
      sql.enable = true;
      bash.enable = true;
      html.enable = true;
      css.enable = true;
      markdown.enable = true;
    };
  in
    foldl' (acc: elem: acc // elem) config configsSet 
