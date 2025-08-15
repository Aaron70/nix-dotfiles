{ nixpkgs, ... }:

let
  myLib = import ./mylib.nix;
in
{
  mkNixosFor = host: nixpkgs.lib.nixosSystem {
    specialArgs = { inherit myLib; };
    modules =  [ 
      { nixpkgs.overlays = [ ]; }

      ../features/nixos

      ../hosts/${host}/configuration.nix
      ../hosts/${host}/hardware-configuration.nix
    ];
  };
}
