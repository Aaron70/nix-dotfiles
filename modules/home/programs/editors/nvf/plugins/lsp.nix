{ ... }:

{
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
}
