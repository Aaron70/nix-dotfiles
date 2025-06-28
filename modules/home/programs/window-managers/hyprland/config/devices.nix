{}:

with builtins; 
rec {
  monitorNames = [ "HDMI-A-2" "HDMI-A-1" "eDP-1" ];

  bindm = [
    # Mouse bindings
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];

  monitor = [
    "${elemAt monitorNames 0}, 1920x1080@100, 0x0, 1"
    "${elemAt monitorNames 1}, 2560x1440@74.93, -2560x0, 1"
    "${elemAt monitorNames 2}, 1920x1080@100, 0x0, 1"
  ];

  input = {
    sensitivity = -0.5;
  };
}
