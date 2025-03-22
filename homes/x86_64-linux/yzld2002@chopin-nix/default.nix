{ inputs, pkgs, system, lib, ... }: {
  apps.misc.enable = true;
  apps.tools.direnv.enable = true;
  apps.editor.lazyvim.enable = true;
}
