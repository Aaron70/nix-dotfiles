{ lib, values, myLib, ... }:

with lib; {
  imports = myLib.importAll ./. "default.nix";

  options.homePrograms.terminals = {
    default = mkOption {
      type = types.str;
      default = values.terminals.default;
      description= "The default terminal.";
    };
  }; 

  config = { };
}
