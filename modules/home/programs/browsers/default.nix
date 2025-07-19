{ myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  options.homePrograms.browsers = { }; 

  config = { };
}
