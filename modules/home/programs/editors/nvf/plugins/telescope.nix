{ ... }:

{
  telescope = { 
    enable = true;

    mappings = {
      lspDefinitions = "gd";
      lspTypeDefinitions = "<leader>gT";
      lspImplementations = "gI";
      lspReferences = "gr";
    };

    setupOpts = {
      defaults = {
        path_display = [ "smart" ];
      };


    };
  };
}
