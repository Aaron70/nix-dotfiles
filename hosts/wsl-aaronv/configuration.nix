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


  values.tmux.extraSearchPaths = "~/personal/dev:3 ${C} ${D}/Aaron:3";

  environment.sessionVariables = {
    C = C;
    D = D;
  };
}
