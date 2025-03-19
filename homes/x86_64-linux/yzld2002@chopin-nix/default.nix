{
  inputs,
  pkgs,
  system,
  lib,
  ...
}: {
    homes.packages = with pkgs; [
      fastfetch
      btop
    ];
}
