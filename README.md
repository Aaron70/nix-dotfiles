# Nix Dotfiles

## Hosts

A host represents an instance of a device or OS running the configuration. Let's say a `laptop-a` or even a `vm` or `wsl` running on `laptop-a` or any other host.
Each host have the following files (if necessary, respectively):

| File | Description | Required For |
| ---- | ----------- | -------- |
| `hardware-configuration.nix` | The hardware configuration of the host. (Usually auto generated and not modified). | NixOS |
| `nixos.nix` | The NixOS configurations for the host. | NixOS |
| `home.nix` | The Home Manager configurations for the host. | Home Manager |
| `darwin.nix` | The Darwin configurations for the host. | Nix Darwin |

These files, will set the configurations for each host, and you can configure your profile or modules here.


The following modules are available to enable and apply common configurations to the hosts to avoid repeated configuration blocks;
* `dotfiles.nixos.common`
* `dotfiles.home.common`

# Modules

The modules folder contains all programs, configs and modules of the dotfiles. Each module should configure just one thing, lets say the module is `tmux` then the module should only configure tmux related things.

The modules should be aware of profile configurations, for example, the profile module defines some `shell`, `terminal`, `browser`, among others variables, so every module of shells, terminals or even browsers, must validate if the given variable is of the name of the module to enable it by default. Otherwise, it must be enabled manually.

## Features

A feature is a set of modules, configurations or other features that enable certain service, program or configuration.
Features are useful to group, configure and activate options under the same category.

For example a `gaming` feature could install and configure `steam`, set env variables or drivers to enable gaming on your host, but if you don't want to enable gaming it would be as easy to disable the `gaming` feature for a specific host.

## Profiles

Profiles are very similar than features, and their main objective is to group different configurations, however profiles are for a more general configuration.
Let say you have a `personal` profile where you have features and modules like `gaming`, `development`, `discord`, but probably you don't need `gaming` for work, so you could have other profile `work` which have only the features and modules you need.  

## Libs
### mylib
| Fuction | Description |
| ------- | ----------- |
| | | 




