{ lib, config, mylib, ... }:

with lib; {
  options.programs.dotfiles.nixos = {
    enable = mylib.mkBoolOption "Whether to enable the common configurations for NixOS hosts." true;
  };
                                                                                                
  config = mkIf cfg.enable { 
  };
}
