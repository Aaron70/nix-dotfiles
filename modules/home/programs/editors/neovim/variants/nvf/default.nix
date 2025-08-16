{ lib, config, myLib, ... }: 

with lib;
let
  cfg = config.programs.home.neovim;
in
{
  imports = myLib.importAll ./. "default.nix";

  config = mkIf (cfg.enable && cfg.variant == "nvf") {
    programs.nvf.enable = true;
    homePrograms.editors.neovim.nvf = {
      keymaps.enable = true;
      options.enable = true;
      appearance.enable = true;
      languages.enable = true;
      plugins.enable = true;
    };
  };
}
