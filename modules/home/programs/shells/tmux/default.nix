{ config, lib,  pkgs, ... }:
let
  shellsCfg = config.homePrograms.shells; 
  cfg = shellsCfg.tmux;
  colors = config.lib.stylix.colors;
in
  with lib;
{ 
  options.homePrograms.shells.tmux = {
    enable = mkEnableOption "Whether to enable Zellij";
  };

  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      mouse = true;
      baseIndex = 1;
      shell = "${pkgs.nushell}/bin/nu"; 
      keyMode = "vi";
      prefix = "C-space";
      plugins = [
        # pkgs.tmuxPlugins.tmux-floax
        pkgs.tmuxPlugins.sensible
        pkgs.tmuxPlugins.resurrect
      ];
      extraConfig = ''
        set -g renumber-windows on  # keep numbering sequential
        set-option -g default-terminal "tmux-256color"
        set-option -ga terminal-overrides ",xterm-256color:Tc"

        # Theme: status
        # set -g status-style bg="#${colors.base00}",fg=black,bright
        set -g status-bg "#${colors.base00}"
        set -g status-left "  "
        set -g status-right "#[fg=orange,bright]#S  "
        
        # Theme: status (windows)
        set -g window-status-format "●"
        set -g window-status-current-format "●"
        set -g window-status-current-style "#{?window_zoomed_flag,fg=yellow,fg=green,nobold}"
        set -g window-status-bell-style "fg=red,nobold"

        # Tmux Sessionizer
        bind-key -r f run-shell "tmux neww tmux-sessionizer"

        # tmux-floax
        set -g @floax-change-path 'true'
      '';
    };
    home.packages = [
      (pkgs.writeShellScriptBin "tmux-sessionizer" (lib.readFile ./tmux-sessionizer.sh))
    ];
    xdg.configFile."tmux-sessionizer/tmux-sessionizer.conf".text = import ./tmux-sessionizer.nix { inherit config; };
  };
}
