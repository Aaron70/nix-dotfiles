{ config, ... }: 

with builtins; 
let
  mainMonitor = "$monitor1";
  secondMonitor = "$monitor2";
  codingWS = "1";
  webWS = "2";
  extraWS = "3";
  mediaWS = "4";
in {
  config = {
    wayland.windowManager.hyprland.settings = {

      variables = { };

      workspace = [
        "${codingWS}, monitor:${mainMonitor}, default:true, on-created-empty:$terminal"
        "${extraWS}, monitor:${mainMonitor}"
      
        "${webWS}, monitor:${secondMonitor}, default:true, on-created-empty:$browser"
        "${mediaWS}, monitor:${secondMonitor}, on-created-empty:multimedia-menu"
      ];

      bind = [
        # Switch to favorite workspaces
        "$mod, U, workspace, ${codingWS}"
        "$mod, I, workspace, ${webWS}"
        "$mod, O, workspace, ${extraWS}"
        "$mod, P, workspace, ${mediaWS}"

        # Switch to numerical workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"

        # Move active window to favorite workspaces
        "$mod SHIFT, U, movetoworkspace, ${codingWS}"
        "$mod SHIFT, I, movetoworkspace, ${webWS}"
        "$mod SHIFT, O, movetoworkspace, ${extraWS}"
        "$mod SHIFT, P, movetoworkspace, ${mediaWS}"

        # Move active window to numerical workspaces
        "$mod, 1, movetoworkspace, 1"
        "$mod, 2, movetoworkspace, 2"
        "$mod, 3, movetoworkspace, 3"
        "$mod, 4, movetoworkspace, 4"
        "$mod, 5, movetoworkspace, 5"
        "$mod, 6, movetoworkspace, 6"
        "$mod, 7, movetoworkspace, 7"
        "$mod, 8, movetoworkspace, 8"
        "$mod, 9, movetoworkspace, 9"
                 
        # Swap workspaces
        "$mod SHIFT, S, swapactiveworkspaces, 0 1"
        "$mod SHIFT, S, focusmonitor, ${mainMonitor}"
        "$mod, PERIOD, movecurrentworkspacetomonitor, ${mainMonitor}"
        "$mod, COMMA, movecurrentworkspacetomonitor, ${secondMonitor}"
        
        # Scroll through workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];
    };
  };
}
