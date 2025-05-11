{ myLib, lib, values, ... }:

with lib; {
  imports = myLib.importAll ./. "default.nix";

  options.homePrograms.browsers = {
    default = mkOption {
      type = types.str;
      default = values.browsers.default;
      description= "The default browser.";
    };
  }; 

  config = { };
}
