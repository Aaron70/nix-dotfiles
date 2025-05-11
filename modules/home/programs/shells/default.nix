{ myLib, lib, values, ... }:

with lib; {
  imports = myLib.importAll ./. "default.nix";

  options.homePrograms.shells = {
    default = mkOption {
      type = types.str;
      default = values.shells.default;
      description= "The default editor.";
    };
  }; 

  config = {
    programs.fzf = {
      enable = true;
    };
  };
}
