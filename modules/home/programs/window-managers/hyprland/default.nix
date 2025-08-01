{ config, lib, ... }:

let
  wmCfg = config.homePrograms.windowManagers; 
  cfg = wmCfg.hyprland;

  workspacesCfg = import ./config/workspaces.nix { monitors = devicesCfg.monitorNames; };
  windowsCfg = import ./config/windows.nix {}; 
  devicesCfg = import ./config/devices.nix { inherit config; };
in
  with lib;
{
  options.homePrograms.windowManagers.hyprland = {
    enable = mkEnableOption "Whether to enable Hyprland Window Manager config";
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
        "$terminal" = config.values.terminals.default.name;
        "$browser" = config.values.browsers.default.name;

        env = {
          env = "HYPRCURSOR_THEME,rose-pine-hyprcursor";
        };

        exec-once = [
          "waybar"
        ];

        exec = [
          "hyprpaper"
        ];

        bind = [
          "$mod, SPACE, exec, $terminal"
          "$mod, RETURN, exec, pkill wofi || wofi --show drun"
          "$mod, C, killactive"
          "$mod, F, fullscreen"
          "$mod SHIFT, F, togglefloating"
          "$mod SHIFT, F, centerwindow"
          "$mod SUPER, E, exec, power-menu"
          "$mod CTRL, U, submap, UI"

        ] ++ workspacesCfg.bind
          ++ windowsCfg.bind;


        # Workspaces
        workspace = workspacesCfg.workspaces;

        bindm = devicesCfg.bindm;
        binds = {
          window_direction_monitor_fallback = "false";
        };

        windowrule = [
          "opacity 1.0 override 1.0 override,class:firefox,title:(.*)(YouTube|Youtube|youtube)(.*)"
        ];

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
          bezier = [
            "bouncy, 0.07, 1.41, 0.12, -0.86"
            "myBezier, 0.05, 0.9, 0.1, 1.05"
          ];

          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 10, default, popin 60%"
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
            size = 3;
            passes = 1;
            new_optimizations = "on";
            ignore_opacity = true;
            vibrancy = 0.86;
            xray = true;
          };

          active_opacity = 0.9;
          inactive_opacity = 0.85;
          fullscreen_opacity = 1.0;
        };

        monitor = devicesCfg.monitor;
        input = devicesCfg.input;

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };
      };

      extraConfig = ''
        #========|Submap: UI|========
        submap = UI
        bind = , b, exec, pkill waybar || waybar
        bind = , U, submap, UI"

        bind = , escape, submap, reset
        bind = , catchall, submap, reset
        submap = reset
        #========|Submap: UI|========


        #========|Submap: MEDIA|========
        bind = $mod CTRL, M, submap, MEDIA
        submap = MEDIA
        binde = , K, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+
        binde = , J, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-
        binde = , M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        binde = , SPACE, exec, playerctl play-pause
        binde = , SPACE, submap, reset
        binde = , L, exec, playerctl next
        binde = , H, exec, playerctl previous
        binde = , COMMA, exec, playerctl position 1-
        binde = , PERIOD, exec, playerctl position 1+
        binde = , SHIFT_COMMA, exec, playerctl position 10-
        binde = , SHIFT_PERIOD, exec, playerctl position 10+

        bind = , escape, submap, reset
        bind = , catchall, submap, reset
        submap = reset
        #========|Submap: MEDIA|========


        #========|Submap: GROUP|========
        bind = $mod, TAB, submap, GROUP
        submap = GROUP

        bind = ,TAB, changegroupactive, f
        bind = SHIFT, TAB, changegroupactive, b
        bind = $mod SHIFT, H, moveintogroup, l"
        bind = $mod SHIFT, J, moveintogroup, d"
        bind = $mod SHIFT, K, moveintogroup, u"
        bind = $mod SHIFT, L, moveintogroup, r"

        bind = , escape, submap, reset
        submap = reset
        #========|Submap: GROUP|========
        '';
    }; 
  };
}
