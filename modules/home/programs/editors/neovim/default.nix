{ lib, ... }:

with lib;
{
  imports = [ ./variants ];    

  options.programs.home.neovim = {
    enable = mkEnableOption "Whether to enable the Neovim (BTW) editor.";
    variant = mkOption {
      description = "The name of the variant to use its configuration.";
      type = types.str;
      default = "nvf";
    };
  };
}
