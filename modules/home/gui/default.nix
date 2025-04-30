{
  imports =
    with builtins;
      map
        (name: ./${name})
        (filter (name: name != "default.nix") (attrNames (readDir ./.)));
}
