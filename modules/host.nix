{ mylib, lib, ... }: 

with mylib; with lib;
{
  imports = [ 
    (mkModule {
      enable = true;
      name = "host";
      options = { cfg, ... }: {
        name = mkOption { type = types.str; description = "The name of the host."; };
        bluetooth = mkBoolOption "Whether the host supports bluetooth." (false || cfg.isLaptop);
        brightness = mkBoolOption "Whether the host display supports brightness control." (false || cfg.isLaptop);
        battery = mkBoolOption "Whether the host has a battery." (false || cfg.isLaptop);
        isLaptop = mkBoolOption "Whether the host is a laptop." false;
        nixosCommonConfigurations = mkBoolOption "Whether to apply common NixOS configurations." true;
        homeCommonConfigurations = mkBoolOption "Whether to apply common Home Manager configurations." true;
      };
      commonConfig = { cfg, ... }: {
        dotfiles.features.laptop-settings.enable = mkDefault cfg.isLaptop;
        dotfiles.nixos.common.enable = mkDefault cfg.nixosCommonConfigurations;
      };
      homeConfig = { cfg, ... }: {
        dotfiles.home.common.enable = mkDefault cfg.homeCommonConfigurations;
      };
      nixosConfig = {};
    })
  ];
}
