{ myLib, lib, config, ... }:

with lib; {
  imports = myLib.importAll ./. "default.nix";

  options.homePrograms.shells = { }; 

  config = {
    programs.fzf = {
      enable = true;
    };
  };
}
