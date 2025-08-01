{ config }:

with builtins; 
rec {
  monitorNames = [ "HDMI-A-2" "HDMI-A-1" ];

  bindm = [
    # Mouse bindings
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];

  monitor = [
    # "${elemAt monitorNames 0}, 1920x1080@100, 0x0, 1"
    ", 1920x1080@100, -1920x0, 1"
    "${elemAt monitorNames 1}, 2560x1440@74.93, 0x0, 1"
  ];

  input = {
    touchpad = {
      natural_scroll = true;
      scroll_factor = 0.5;
    };
    sensitivity = config.values.devices.mouse.sensitivity;
  };
}
