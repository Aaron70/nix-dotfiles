# Nix Dotfiles Configurations

## Installation (NixOS)

Run the following command to apply the NixOS configuration:

```bash
cd nix-dotfiles
sudo nix-rebuild switch .#aaronv
```

## Installation (Non NixOS)

Run the following command to install [_Nix_](https://nixos.org/):

```bash
mkdir ~/.config/nix
echo "extra-experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
sh <(curl -L https://nixos.org/nix/install) --daemon
```

## Apply home manager configurations

Then run the following command to install [_Home manager_](https://nix-community.github.io/home-manager/) and apply the Nix configurations:

```bash
cd nix-dotfiles
nix run home-manager -- switch --flake .#aaronv
```

If you already have _Home Manager_ installed and you want to apply/refresh the configurations, run:

```bash
cd nix-dotfiles
home-manager switch --flake .#aaronv
```

