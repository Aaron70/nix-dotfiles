{ myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  nixosPrograms = {
  };
}
