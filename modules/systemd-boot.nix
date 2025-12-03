{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {
    configurationLimit = mkOption {
      type = types.number;
      description = "The limit of generations to show";
      default = 7;
    };
  };
  nixosConfig = { cfg, ... }: {
    boot.loader.systemd-boot = {
      enable = mkDefault true;
      configurationLimit = mkDefault cfg.configurationLimit;
    };
    boot.loader.efi.canTouchEfiVariables = true;
  };
  homeConfig = { ... }: {};
in
{ imports = [(mkModule { path = [ "modules" ]; name = "systemd-boot"; inherit nixosConfig homeConfig options; })]; }
