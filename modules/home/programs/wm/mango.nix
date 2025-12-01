{ lib, config, ... }:

with lib;
{
  config = mkIf config.programs.home.mango.enable {
    wayland.windowManager.mango = let 
      mod = "alt";
    in{
      enable = true;
      settings = ''
        # ------------------------------------------|Miscellaneous|------------------------------------------
        cursor_hide_timeout=1
        drag_tile_to_tile=1
        view_current_to_back=0
        no_border_when_single=1
        border_radius=7

        # ------------------------------------------|Trackpad & Mouse|------------------------------------------
        trackpad_natural_scrolling=1
        disable_while_typing=0

        # ------------------------------------------| Scroller Layout|------------------------------------------
        scroller_focus_center=1
        edge_scroller_pointer_focus=0
        scroller_default_proportion=1.0
        scroller_proportion_preset=0.5,0.8,1.0
        bind=ALT,b,switch_proportion_preset,

        # ------------------------------------------|Key Bindings|------------------------------------------
        # reload config
        bind=${mod},r,reload_config

        # menu and terminal
        bind=${mod},space,spawn,ghostty
        bind=${mod},return,spawn,pkill wofi || wofi --show drun
        bind=${mod},x,killclient,


        # Move focus
        bind=${mod},h,focusdir,left
        bind=${mod},j,focusdir,down
        bind=${mod},k,focusdir,up
        bind=${mod},l,focusdir,right

        # Move window
        bind=${mod}+shift,h,exchange_client,left
        bind=${mod}+shift,j,exchange_client,down
        bind=${mod}+shift,k,exchange_client,up
        bind=${mod}+shift,l,exchange_client,right

        # Move window to Tags (Workspaces)
        bind=${mod}+shift,u,tag,1
        bind=${mod}+shift,i,tag,2
        bind=${mod}+shift,o,tag,3
        bind=${mod}+shift,p,tag,4
        bind=${mod}+shift,1,tag,1
        bind=${mod}+shift,2,tag,2
        bind=${mod}+shift,3,tag,3
        bind=${mod}+shift,4,tag,4
        bind=${mod}+shift,5,tag,5
        bind=${mod}+shift,6,tag,6
        bind=${mod}+shift,7,tag,7
        bind=${mod}+shift,8,tag,8
        bind=${mod}+shift,9,tag,9

        # Tags (Workspaces)
        bind=${mod},u,view,1
        bind=${mod},i,view,2
        bind=${mod},o,view,3
        bind=${mod},p,view,4
        bind=${mod},1,view,1
        bind=${mod},2,view,2
        bind=${mod},3,view,3
        bind=${mod},4,view,4
        bind=${mod},5,view,5
        bind=${mod},6,view,6
        bind=${mod},7,view,7
        bind=${mod},8,view,8
        bind=${mod},9,view,9

      '';
      autostart_sh = ''
        # see autostart.sh
        # Note: here no need to add shebang
      '';
    };
  };

  options.programs.home.mango = {
    enable = mkEnableOption "Whether to enable the MangoWM.";
    variant = mkOption {
      description = "The name of the variant to use its configuration.";
      type = types.str;
      default = "default";
    };
  };
}
