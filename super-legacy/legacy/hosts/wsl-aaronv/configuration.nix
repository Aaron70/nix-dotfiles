{ config, lib, ... }:

let
  C = "/mnt/c";
  D = "/mnt/d";
in
{
  imports = [
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = config.values.user.username;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  environment.sessionVariables = {
    C = C;
    D = D;
  };
}
