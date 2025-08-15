{ lib, config, ... }: 

with lib;
let 
  cfg = config.features.home.development;
in
{
  options.features.home.development = {
    enable = mkEnableOption "Whether to enable common programs, services or configurations related to Softawre Development.";
  };


  config = mkIf cfg.enable {
    # Git, Gh, Lazygit
    programs.home.git.enable = true;
    programs.home.git.integrations = true;

    # Terminals
    programs.home.ghostty.enable = true;

    # Shells
    programs.home.zsh.enable = true;
    programs.home.oh-my-posh.enable = true;

    # Editors
  };
}
