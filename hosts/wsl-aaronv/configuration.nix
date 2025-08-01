{ config, lib, ... }:

{
  imports = [
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = config.values.user.username;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
