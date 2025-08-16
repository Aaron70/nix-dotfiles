{ config, lib, ... } :

let
  cfg = config.programs.home.neovim.nvf.languages;
in
  with lib;
{

  options.programs.home.neovim.nvf.languages = {
    enable = mkEnableOption "Whether to enable the configurations for the supported languages";
  };

  config = mkIf cfg.enable {
    programs.nvf.settings.vim.languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableDAP = true;

      nix = import ./nix.nix;
      go = import ./go.nix;
      java = import ./java.nix;
      lua.enable = true;
      python.enable = true;
      ts.enable = true;
      sql.enable = true;
      bash.enable = true;
      html.enable = true;
      css.enable = true;
      markdown.enable = true;
    };
  };
}
