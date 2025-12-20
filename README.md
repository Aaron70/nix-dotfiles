# Nix Dotfiles

## How is structured?

This configuration intends to be very modular to be able to create different configurations for different use cases and even different devices.

The configuration is structured as follows:

* `Hosts`: This is the higher level of configuration. They are meant to describe the device, or instance running the configuration. It could be physical device, a **VM**, **container**, or even **WSL** running Home-Manager. 

* `Profiles`: This is the next level and is meant to describe who's using the configuration and it's intentions with it. Development, Gaming, Work? Useful to define "users" with their own set of programs and features.

* `Features`: The features are useful to group modules and/or configurations to activate a certain functionalities. For example, a `development` feature could enable some editors, coding environments and other development tools.

* `Modules`: A module is group of configurations that aims activate one functionality or program. The idea is to be as atomic as possible to enable just one thing, as `features` are used to group multiple modules to activate bigger and complex configurations. 


## How to add a new host?

Just add a new directory within the `hosts` directory, the name of the directory will be the name of the host you're creating. 
You must add a file named `configuration.nix` and other one named `hardware-configuration.nix`. The both files must be nix modules. The `hardware-configuration` configuration must contain the hardware configuration for the host (if necessary, otherwise can be an empty module). While the `configuration` file must have the configuration for the host, can be enabling or disabling modules or features.

By default the `host` module is enabled, so you could configure your host right away in this file. See the `host` module.

See the following example:

```nix
# hosts/my-host/configuration.nix
{ ... }: 

{
  imports = [ ./hardware-configuration.nix ];

  dotfiles.host.name = "my-host"; # Optional name that could be used by some modules from the configuration.
  dotfiles.host.isLaptop = true;
}
```

Then go to the `flake.nix` file and create the respective configurations for your new host. 

You can use `syslib.mkNixosFor <flakeName> <host> <profile>` to create a configuration for the newly created host.
The `<flakeName>` is should match the name of the configuration (the key of the attr set key that holds the configuration).
The `<host>` is the name of the host that you created, must match the name of the directory you made in the `hosts` directory.
The `<profile>` the name of the profile to use in the configuration, must match with one of the file in the `profiles` directory.

Then you can run the `sudo nixos-rebuild switch --flake .#<flakeName>` command to build and switch to your new configuration.
If the `nixosCommonConfigurations` is enabled (is enabled by default) then you should see two shell aliases to build your configuration: `ntest` and `nswitch`.

## How to add a new profile?

## How to add a new feature?

## How to add a new module?

# Troubleshoot

## Mounted partition as Read-Only

This is probably cause by `Fast Boot` of windows (of course).
Disable fast boot from windows and from  the boot menu.
[Disable fast startup](https://www.windowscentral.com/software-apps/windows-11/how-to-enable-or-disable-fast-startup-on-windows-11)
