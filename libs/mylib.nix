{
  importAll = path: exclude:
    with builtins;
      map
        (name: "${path}/${name}")
        (filter (name: name != exclude) (attrNames (readDir path)));
}
