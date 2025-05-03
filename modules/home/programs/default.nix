{ myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  homePrograms = {
    git = {
      enable = true;
      integrations = true;
    };
    shells = {
      nushell.enable = true;
      zoxide.enable = true;
    };
  };
}
