{ ... }@inputs:

with inputs.nixpkgs.lib; rec {
  importAll = path: exclude:
    with builtins;
      map
        (name: "${path}/${name}")
        (filter (name: name != exclude) (attrNames (readDir path)));

  mkBoolOption = description: default: mkOption {
      type = types.bool;
      default = default;
      description = description;
    };

  foldr = f: init: list:
    if list == [] then init
    else f (builtins.head list) (foldr f init (builtins.tail list));

  setPath =  keys: value:
    foldr (key: acc: { ${key} = acc; }) value keys;

  getPath = keys: attrs:
    builtins.foldl' (acc: key: acc.${key}) attrs keys;

  mkModule = {
    enable ? false,
    name,
    path ? [],
    nixosConfig ? {},
    homeConfig ? {},
    options ? {},
  }: 
  ({ lib, ... }@inputs: 
    with lib;
    let
      modulePath = path ++ [ name ];
      cfg = getPath modulePath inputs.config.dotfiles;
      dotfilesCfg = inputs.config.dotfiles;
      moduleOptions = if builtins.isFunction options then (options (inputs // { inherit cfg dotfilesCfg; })) else options;
      nixosConfiguration = if builtins.isFunction nixosConfig then (nixosConfig (inputs // { inherit cfg dotfilesCfg; })) else nixosConfig;
      homeConfiguration = if builtins.isFunction homeConfig then (homeConfig (inputs // { inherit cfg dotfilesCfg; })) else homeConfig;
    in {
      options.dotfiles = setPath modulePath ({
        enable = mkBoolOption "Whether to enable the ${name} module." enable;
      } // moduleOptions);

      imports =
        lib.optionals inputs.isNixos [
          ({ ... }: { config = mkIf cfg.enable nixosConfiguration; })
        ]
        ++ lib.optionals inputs.isHomeManager [
          ({ ... }: { config = mkIf cfg.enable homeConfiguration; })
        ];
    });
}
