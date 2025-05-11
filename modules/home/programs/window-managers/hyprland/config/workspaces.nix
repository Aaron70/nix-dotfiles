{ monitors }: 

with builtins; 
let
  mainMonitor = elemAt monitors 0;
  secondMonitor = elemAt monitors 1;
  codingWS = "1";
  webWS = "2";
  mediaWS = "3";
  extraWS = "4";
in {

  variables = {
    
  };

  workspaces = [
    "${codingWS}, monitor:${mainMonitor}, default:true, on-created-empty:$terminal"
    "${extraWS}, monitor:${mainMonitor}"
  
    "${webWS}, monitor:${secondMonitor}, default:true, on-created-empty:$browser"
    "${mediaWS}, monitor:${secondMonitor}, on-created-empty:spotify"
  ];

  bind = [
    # Switch to favorite workspaces
    "$mod, U, workspace, ${codingWS}"
    "$mod, I, workspace, ${webWS}"
    "$mod, O, workspace, ${mediaWS}"
    "$mod, P, workspace, ${extraWS}"

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
    "$mod SHIFT, O, movetoworkspace, ${mediaWS}"
    "$mod SHIFT, P, movetoworkspace, ${extraWS}"

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
    
    # Scroll through workspaces
    "$mod, mouse_down, workspace, e+1"
    "$mod, mouse_up, workspace, e-1"
  ];
}
