{ pkgs, config, ... }:

{
  imports = [ ../home.nix ];

  home.packages = with pkgs; [
    upower
    htop
    wl-clipboard
  ];

  home.shellAliases = {
    nswitch = "sudo nixos-rebuild switch --flake /home/${config.profile.user.username}/nix-dotfiles#aaronv";
    ntest = "sudo nixos-rebuild test --flake /home/${config.profile.user.username}/nix-dotfiles#aaronv";
  };
}
