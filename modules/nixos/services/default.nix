{ myLib, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  nixosServices = {
    docker.enable = true;
  };
}
