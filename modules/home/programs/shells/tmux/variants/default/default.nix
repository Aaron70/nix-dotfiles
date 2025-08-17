{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.programs.home.tmux;
  colors = {
    base00 = "FFFFFF";
  };
in
{
  config = mkIf (cfg.enable && cfg.variant == "default") {
    programs.tmux = {
      enable = true;
      mouse = true;
      baseIndex = 1;
      shell = config.profile.shell.path; 
      keyMode = "vi";
      prefix = cfg.prefix;
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
  };
}
