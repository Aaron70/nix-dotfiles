{ myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  nixosPrograms = { 
    windowManagers.hyprland.enable = true;
  };
}
