{ myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";
  options.homePrograms.windowManagers = { }; 
  config = { };
}
