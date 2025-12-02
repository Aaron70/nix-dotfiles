# Nix Dotfiles

## Hosts

A host represents an instance of a device or OS running the configuration. Let's say a `laptop-a` or even a `vm` or `wsl` running on `laptop-a` or any other host.
Each host have the following files (if necessary):

| File | Description | Required For |
| ---- | ----------- | -------- |
| `hardware-configuration.nix` | The hardware configuration of the host. (Usually auto generated and not modified). | NixOS |
| `nixos.nix` | The NixOS configurations for the host. | NixOS |
| `home.nix` | The Home Manager configurations for the host. | Home Manager |
| `darwin.nix` | The Darwin configurations for the host. | Nix Darwin |


On the root directory of the `hosts` path, there are some `nixos.nix`, `home.nix` and `darwin.nix` files. Those file are modules with common configurations that can be used by each host if required.
A Host may or may not import whichever file it needs to add those common configurations. Each host then can overwrite any of the configurations in their respective files.

## Lib

An utility library to have common and useful functions.

| Fuction | Description |
| ------- | ----------- |
| | | 




