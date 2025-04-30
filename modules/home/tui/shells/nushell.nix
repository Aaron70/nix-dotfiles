{ values, ... }:

with values.shells;
{
  programs.nushell = {
    enable = nushell.enable;

    configFile.text = ''
      $env.config.buffer_editor = "${values.editors.default}"
      $env.config.show_banner = false
    '';
  };
}
