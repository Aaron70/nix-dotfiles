{ pkgs, ... }:

{
  imports = [ ../home.nix ];

  home.packages = with pkgs; [
    upower
    htop
    wl-clipboard
  ];

  home.shellAliases = {
    nswitch = "sudo nixos-rebuild switch --flake ~/nix-dotfiles#aaronv";
    ntest = "sudo nixos-rebuild test --flake ~/nix-dotfiles#aaronv";
  };
}
