{ config, lib, ... } :

let
  plugin = "lsp";
  editorsCfg = config.homePrograms.editors; 
  cfg = editorsCfg.neovim.nvf.plugins.${plugin};
in
  with lib;
{
  options.homePrograms.editors.neovim.nvf.plugins.${plugin} = {
    enable = mkEnableOption "Whether to enable all the plugin ${plugin}";
  };

  config = mkIf cfg.enable {
    programs.nvf.settings.vim = {
      lsp = {
        enable = true;

        formatOnSave = false;
        nvim-docs-view.enable = true;

        mappings = {
          codeAction = "<leader>la";
          format = "<leader>lf";
          goToDeclaration = "gD";
          #goToDefinition = "gd";
          #goToType = "<leader>gT";

          #listReferences = "gr";
          # listImplementations = "gI";

          previousDiagnostic = "<leader>gE";
          nextDiagnostic = "<leader>ge";

          renameSymbol = "<leader>rn";
        };

      };
    };
  };
}
