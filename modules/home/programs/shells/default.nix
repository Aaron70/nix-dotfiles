{ lib, values, myLib, ... }:

with lib; {
  imports = myLib.importAll ./. "default.nix";

  options.homePrograms.shells = {
    # TODO: Move to editors modules
    defaultEditor = mkOption {
      type = types.str;
      default = values.editors.default;
      description= "The default editor.";
    };
  }; 

  config = {
    programs.fzf = {
      enable = true;
    };
  };
}
