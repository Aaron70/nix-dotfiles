{ mylib, ... }:
{ 
  imports = mylib.importAll ./. [ "default.nix" "resources"]; 
}
