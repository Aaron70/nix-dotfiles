{ pkgs, lib, ... }:
{
  imports = [ ../home.nix ];

  home.packages = with pkgs; [
    upower
    htop
    wl-clipboard
    brightnessctl
  ];

  home.shellAliases = {
    nswitch = "sudo nixos-rebuild switch --flake ~/nix-dotfiles#laptop-aaronv";
    ntest = "sudo nixos-rebuild test --flake ~/nix-dotfiles#laptop-aaronv";
  };


  profile.devices.mouse.sensitivity = lib.mkForce 0.1;
}
