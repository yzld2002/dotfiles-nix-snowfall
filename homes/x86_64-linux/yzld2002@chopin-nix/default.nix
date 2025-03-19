{
  inputs,
  pkgs,
  system,
  lib,
  ...
}: {
    packages = with pkgs; [
      fastfetch
      btop
    ];
    apps.misc.enable = true;
    apps.tools.direnv.enable = true;
}
