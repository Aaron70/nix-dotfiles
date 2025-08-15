
# Profiles 

1. Personal
2. Work

# Hosts

1. nix-pc
2. nix-laptop
3. mac 
4. wsl-pc
5. wsl-laptop


# Configurations

aaronv nix-pc personal

aaronv-laptop nix-laptop personal 

aaronv-work mac work

aaronv-wsl wsl-pc personal

aaronv-wsl wsl-laptop work
























# Concepts

## Host 

Is the OS that will run the Nix configuration files. (A NixOS, MacOS, Linux, wsl, ...)
And is directly bound to the `hardware-configuration.nix` file, for those OS that apply. 

## Profiles

A set of configurations and/or programs that can be shared among multiple hosts 


# Folder structure
```
hosts/
    nix-pc/
        hardware-configuration.nix
        configuration.nix 
        home.nix
    nix-laptop/
        hardware-configuration.nix
        configuration.nix 
        home.nix 
    wsl/
        hardware-configuration.nix
        configuration.nix
        home.nix
    mac/
        darwin.nix
        home.nix
    linux/
        home.nix
profiles/
    nixos.nix
    home.nix
    darwing.nix
    personal/
        values.nix
        nixos.nix
        home.nix
    work/
        values.nix
        darwing.nix
        home.nix
programs/
    nixos/
        ...
    home/
        ...
    darwing/
        ...
services/
    nixos/
        ...
    home/
        ...
    darwing/
        ... 
```
