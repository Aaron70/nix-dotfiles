{ mylib, lib, config, pkgs, ... }: 
with mylib; with lib;
let
  colors = if (config.lib ? stylix) then config.lib.stylix.colors else { base00 = "FFFFFF"; };
  options = {
    extraSearchPaths = mkOption {
      description = "The list of paths to add to the tmux-sessionizer script";
      type = types.str;
      default = "";
    };
    prefix = mkOption {
      description = "The prefix used for the tmux configuration";
      type = types.str;
      default = "C-space";
    };
  };
  nixosConfig = { ... }: {};
  homeConfig = { cfg, ... }: {
    xdg.configFile."tmux-sessionizer/tmux-sessionizer.conf".text = import ./tmux-sessionizer.nix { inherit config; };
    home.packages = [
      (pkgs.writeShellScriptBin "tmux-sessionizer" (lib.readFile ./scripts/tmux-sessionizer.sh))
      (pkgs.writeShellScriptBin "start-session" (lib.readFile ./scripts/start-session.sh))
    ];

    programs.tmux = {
      enable = true;
      mouse = true;
      baseIndex = 1;
      shell = config.dotfiles.profile.shell.path; 
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

        
        set-option -g default-command "${config.dotfiles.profile.shell.path}" # Fix tmux opening sh on MacOS
      '';
    };
  };
in
{ imports = [(mkModule { path = [ "modules" ]; name = "tmux"; inherit nixosConfig homeConfig options; })]; }
