{ myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  options.homePrograms.shells = { }; 

  config = {
    programs.fzf = {
      enable = true;
    };
  };
}
