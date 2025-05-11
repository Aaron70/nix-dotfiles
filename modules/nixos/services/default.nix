{ myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  nixosServices = {
  };
}
