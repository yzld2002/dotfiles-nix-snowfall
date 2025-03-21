{ inputs, pkgs, system, lib, ... }: {
  home.packages = with pkgs; [ fastfetch btop ];
  apps.misc.enable = true;
  apps.tools.direnv.enable = true;
  apps.tools.lazyvim.enable = true;
}
