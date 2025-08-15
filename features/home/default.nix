{ myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  options.features.nixos = {};
}
