{ lib, ... }:

with lib;
{
  imports = [ ./variants ];    

  options.programs.home.oh-my-posh = {
    enable = mkEnableOption "Whether to enable the oh-my-posh prompt.";
    variant = mkOption {
      description = "The name of the variant to use its configuration.";
      type = types.str;
      default = "default";
    };
  };
}
