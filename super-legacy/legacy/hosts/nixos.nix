# A set of common configurations for hosts running NixOS 
{ ... }:

{
  import = [
    ../../services/bluetooth.nix
    ../../services/boot.nix
  ];
}
