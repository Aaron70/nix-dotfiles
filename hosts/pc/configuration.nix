{ ... }: 

{
  imports = [ ./hardware-configuration.nix ];

  dotfiles.host.name = "PC";
  dotfiles.host.bluetooth = true;
}
