{ config, lib, ... }:

let
  wmCfg = config.homePrograms.windowManagers; 
  cfg = wmCfg.hyprland;
  monitors = [ "HDMI-A-2" "HDMI-A-1" ];
  workspacesCfg = import ./config/workspaces.nix { inherit monitors; };
in
  with lib;
{
  options.homePrograms.windowManagers.hyprland = {
    enable = mkEnableOption "Weather to enable Hyprland Window Manager config";
  };

  config = mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = "${./config/wallpapers/wallhaven.jpg}";
        wallpaper = ",${./config/wallpapers/wallhaven.jpg}";
      };
    };

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "debug:disable_logs" = false;
        "$mod" = "ALT";
        "$terminal" = config.homePrograms.terminals.default;
        "$browser" = config.homePrograms.browsers.default;

        exec-once = [
          "waybar"
        ];

        exec = [
          "hyprpaper"
        ];

        bind = [
          "$mod, SPACE, exec, $terminal"
          "$mod, M, exec, pkill wofi || wofi --show drun"
          "$mod, Q, killactive"
          "$mod, F, fullscreen"
          "$mod SHIFT, F, togglefloating"
          "$mod SUPER, E, exit"
          "$mod SUPER, R, exec, hyprctl reload"
         
          # Move focus with mod + hjkl
          "$mod, H, movefocus, l"
          "$mod, J, movefocus, d"
          "$mod, K, movefocus, u"
          "$mod, L, movefocus, l"
        ] ++ workspacesCfg.bind;

        # Mouse bindings
        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

        # Workspaces
        workspace = workspacesCfg.workspaces;

        binds = {
          window_direction_monitor_fallback = "false";
        };

        general = {
          gaps_in = 4;
          gaps_out = "7, 15, 15, 15";
          border_size = 2;
          resize_on_border = true;
          allow_tearing = false;
          layout = "dwindle";
        };

        animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };

        decoration = {
          rounding = 7;
          blur = {
            enabled = true;
            size = 2;
            passes = 1;
            new_optimizations = "on";
            ignore_opacity = true;
            xray = true;
          };

          active_opacity = 0.9;
          inactive_opacity = 0.85;
          fullscreen_opacity = 1.0;
        };

        monitor = [
          "${elemAt monitors 0}, 1920x1080@100, 0x0, 1"
          "${elemAt monitors 1}, 2560x1440@74.93, -2560x0, 1"
        ];

        # misc = {
        #   disable_hyprland_logo = true;
        #   disable_splash_rendering = true;
        # };
        #
      };
    }; 
  };
}
