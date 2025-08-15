{ myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  options.homePrograms.terminals = { }; 

  config = {
    # TODO: Remove or add a module for Kitty
    programs.kitty.enable = true;
  };
}
