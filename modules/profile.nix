{ mylib, lib, ... }: 

with mylib; with lib;
let
  packageOption = types.submodule ({ config, ... }: {
    options = {
      display = mkOption { 
        description = "The display name of the package. Not necessarily the name of the command. E.g: Neovim.";
        type = types.str; 
        default = config.name;
      };
      name = mkOption { 
        description = "The name of the command used to execute the package. E.g: nvim.";
        type = types.str; 
      };
      path = mkOption { 
        description = "The nix path to where the package is stored.";
        type = types.str;
        default = config.name;
      };
    };
  });
  userOption = mkOption {
      description = "The information of the user";
      type = types.submodule {
        options = {
          fullname = mkOption { type = types.str; description = "The fullname of the user. Displayed in the session manager."; };
          username = mkOption { type = types.str; description = "The alias of the user. Used in most of the configurations."; };
          email = mkOption { type = types.str; description = "Email to login the user in different programs."; };
        };
      };
    };

  envVariables = cfg: {
    SHELL = cfg.shell.name;
    EDITOR = cfg.editor.name;
    BROWSER = cfg.browser.name;
  };
in
{
  imports = [ 
    (mkModule {
      enable = true;
      name = "profile";
      options = {
        user = userOption;
        version = mkOption { description = "The version of the Nix channels"; type = types.str; };
        shell = mkOption { description = "The default shell"; type = packageOption; };
        terminal = mkOption { description = "The default terminal emulator"; type = packageOption; };
        editor = mkOption { description = "The default editor"; type = packageOption; };
        browser = mkOption { description = "The default browser"; type = packageOption; };
      };
      homeConfig = { cfg, ... }: {
        home.sessionVariables = envVariables cfg;
      };
      nixosConfig = { cfg, ... }: {
        environment.sessionVariables = envVariables cfg;
      };
    })
  ];
}
