{ config, lib, ... }:

with lib;
{
  imports = [
    ../nixos.nix
    <nixos-wsl/modules>
  ];

  features.nixos.boot.enable = mkForce false;

  wsl.enable = true;
  wsl.defaultUser = config.profile.user.username;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
