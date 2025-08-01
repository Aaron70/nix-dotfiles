{ lib, config, ... }:

with lib;
let 
  userModule = types.submodule {
    options = {
      fullname = mkOption { type = types.str; };
      username = mkOption { type = types.str; };
      email = mkOption { type = types.str; };
    };
  };

  packageModule = types.submodule {
    options = {
      name = mkOption { type = types.str; };
      package = mkOption { type = types.package; };
    };
  };
in
{
  config = {
    values = {
      users = [
        {
          fullname = "Aaron Vargas";
          username = "aaronv";
          email = "aarongeovanny70@gmail.com";
        }
      ];

      editors.default.name = "nvim";
      browsers.default.name = "zen";
      terminals.default.name = "ghostty";
      shells.default.name = "nu";
    };
  };


  options.values = {
    version = mkOption {
      type = types.str;
      default = "24.11";
      description = "The Nix version of packages";
    };

    users = mkOption {
      type = types.listOf userModule;
    };

    user = mkOption {
      type = userModule;
      default = builtins.head config.values.users;
    };

    editors = mkOption {
      type = types.submodule {
        options = {
          default = mkOption { type = packageModule; };
        };
      };
    };

    browsers = mkOption {
      type = types.submodule {
        options = {
          default = mkOption { type = packageModule; };
        };
      };
    };

    terminals = mkOption {
      type = types.submodule {
        options = {
          default = mkOption { type = packageModule; };
        };
      };
    };

    shells = mkOption {
      type = types.submodule {
        options = {
          default = mkOption { type = packageModule; };
        };
      };
    };


    devices = mkOption {
      type = types.submodule {
        options = {
          mouse = mkOption {
            type = types.submodule {
              options = {
                sensitivity = mkOption { type = types.float; default = 0.2; };
              };
            };
            default = {};
          };
        };
      };
      default = {};
    };
  };
}

