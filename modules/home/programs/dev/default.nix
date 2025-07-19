{ lib, myLib, ... }:

with lib; {
  imports = myLib.importAll ./. "default.nix";

  options.homePrograms.development = {
    default = mkOption {
      type = types.bool;
      default = true;
      description= "Whether to enable development programs.";
    };
  }; 

  config = { };
}
