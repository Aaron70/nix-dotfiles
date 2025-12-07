{ ... }: 

{
  imports = [ ./hardware-configuration.nix ];

  dotfiles.host.name = "MSI Laptop";
  dotfiles.host.isLaptop = true;
}
