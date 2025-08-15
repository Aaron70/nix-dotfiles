{ myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  homeServices = {
    playerctl.enable = true;
    dunst.enable = true;
  };
}
