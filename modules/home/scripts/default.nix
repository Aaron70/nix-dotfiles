{ pkgs, lib, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "select-fzf" (lib.readFile ./select-fzf.sh))
    (pkgs.writeShellScriptBin "select-fzf-path" (lib.readFile ./select-fzf-path.sh))
    (pkgs.writeShellScriptBin "custom-fzf-preview" (lib.readFile ./custom-fzf-preview.sh))
    (pkgs.writeShellScriptBin "cdfzf" (lib.readFile ./cdfzf.sh))
  ];
}
