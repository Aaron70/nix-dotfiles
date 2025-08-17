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
    programs.home.git.enable = mkDefault true;
    programs.home.git.integrations = mkDefault true;

    # Terminals
    programs.home.ghostty.enable = mkDefault true;

    # Shells
    programs.home.zsh.enable = mkDefault true;
    programs.home.oh-my-posh.enable = mkDefault true;
    programs.home.tmux.enable = mkDefault true;

    # Editors
    programs.home.neovim.enable = mkDefault true;

    # Languages
    programs.home.go.enable = true;
    programs.home.java.enable = true;

    # Tools
    programs.home.lazydocker.enable = true;
  };
}
