{ ... }:
{
  imports = [ 
    ./hardware-configuration.nix
    ../bluetooth.nix
    ../boot.nix
  ];

  source-persisted-configs.enable = true; 
}
