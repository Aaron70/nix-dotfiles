{}:

{
  bind = [
    # Move focus with mod + hjkl
    "$mod, H, movefocus, l"
    "$mod, J, movefocus, d"
    "$mod, K, movefocus, u"
    "$mod, L, movefocus, r"

    # Move window with mod SHIT + hjkl
    "$mod SHIFT, H, movewindow, l"
    "$mod SHIFT, J, movewindow, d"
    "$mod SHIFT, K, movewindow, u"
    "$mod SHIFT, L, movewindow, r"
  ];
}
