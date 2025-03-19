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
}
