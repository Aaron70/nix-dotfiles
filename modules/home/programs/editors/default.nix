{ lib, values, myLib, ... }:

with lib; {
  imports = myLib.importAll ./. "default.nix";

  options.homePrograms.editors = {
    defaultEditor = mkOption {
      type = types.str;
      default = values.editors.default;
      description= "The default editor.";
    };
  }; 

  config = { };
}
