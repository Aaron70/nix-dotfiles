{ lib, config, pkgs, inputs, ... }: 

with lib;
let
  cfg = config.programs.home.neovim;
in
{
  imports = [ inputs.nvim.homeModule ];
  config = mkIf (cfg.enable && cfg.variant == "personal") {
    nvim = {
      enable = true;
      packageNames = [ "nvim" ];
    };
  };
}
