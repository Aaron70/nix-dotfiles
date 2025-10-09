{ lib, config, pkgs, ... }: 

with lib;
let
  cfg = config.programs.home.neovim;
in
{
  config = mkIf (cfg.enable && cfg.variant == "neovim") {
    home.packages = with pkgs; [
      neovim
    ];
  };
}
