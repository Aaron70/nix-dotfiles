{ myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";
  options.nixosPrograms.windowManagers = { }; 
  config = { };
}
