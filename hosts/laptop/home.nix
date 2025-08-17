{ pkgs, ... }:
{
  imports = [ ../home.nix ];

  home.packages = with pkgs; [
    upower
    htop
    wl-clipboard
  ];
}
