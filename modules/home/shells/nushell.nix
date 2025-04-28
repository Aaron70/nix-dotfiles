{ values, ... }:

with values.shells;
{
  programs.nushell = {
    enable = nushell.enable;
  };
}
