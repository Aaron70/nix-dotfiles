{ config, lib, ... }:

let
  wmCfg = config.homePrograms.windowManagers; 
  cfg = wmCfg.hyprland;

in
  with lib;
{
  options.homePrograms.windowManagers.hyprland = {
    enable = mkEnableOption "Weather to enable Hyprland Window Manager config";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "ALT";
        "$terminal" = config.homePrograms.terminals.default;
        bind = [
          "$mod, SPACE, exec, $terminal"
          "$mod, Q, killactive"
          "$mod, F, fullscreen"
          "$mod SHIFT, F, togglefloating"

          # Move focus with mod + hjkl
          "$mod, H, movefocus, l"
          "$mod, J, movefocus, d"
          "$mod, K, movefocus, u"
          "$mod, L, movefocus, l"

          # Move active window to favorite workspaces
          "$mod SHIFT, U, movetoworkspace, 1"
          "$mod SHIFT, I, movetoworkspace, 2"
          "$mod SHIFT, O, movetoworkspace, 3"
          "$mod SHIFT, P, movetoworkspace, 4"

          # Switch to favorite workspaces
          "$mod, U, workspace, 1"
          "$mod, I, workspace, 2"
          "$mod, O, workspace, 3"
          "$mod, P, workspace, 4"

          # Scroll through workspaces
          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"

          # TODO: Add support for moving and resizing windows with the mouse
        ];
      };
    }; 
  };
}
