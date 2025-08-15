{ config, lib, myLib, ... }:

let
  editorsCfg = config.homePrograms.editors; 
  cfg = editorsCfg.neovim.nvf;
in
  with lib;
{
  imports = myLib.importAll ./. "default.nix";

  options.homePrograms.editors.neovim.nvf = {
    enable = mkEnableOption "Whether to enable Nvf";
  };

  config = mkIf cfg.enable {
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
