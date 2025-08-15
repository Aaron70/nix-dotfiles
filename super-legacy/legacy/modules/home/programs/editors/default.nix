{  myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  options.homePrograms.editors = {}; 

  config = { };
}
