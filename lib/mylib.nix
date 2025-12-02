{ lib, nixpkgs, extraNixosModules, ... }@inputs:

let
   mylib = import ../lib/mylib.nix inputs;
in 
with lib; {
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

  mkModule = config: 
    ({ ... }: {

    });

  mkNixosFor = host: 
    nixpkgs.lib.nixosSystem {
      specialArgs = { inherit mylib inputs; };
      modules =  [ 
        { nixpkgs.overlays = [ ]; }

        ../hosts/${host}/nixos.nix
        ../hosts/${host}/hardware-configuration.nix

      ] ++ extraNixosModules;
    };
}
