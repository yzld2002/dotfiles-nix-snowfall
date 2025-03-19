{
  inputs,
  pkgs,
  system,
  lib,
  home,
  ...
}: {
    home.packages = with pkgs; [
      fastfetch
      btop
    ];
    apps.misc.enable = true;
    apps.tools.direnv.enable = true;
}
