{ values, ... }:

with values.shells;
{
  programs.zoxide = {
    enable = true;

    enableNushellIntegration = nushell.enable;

    options = [ "--cmd" "cd" ];
  };
}
