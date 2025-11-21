{
  inputs,
  pkgs,
  system,
  lib,
  ...
}: {
  apps.misc.enable = true;
  apps.shell.zsh.enable = true;
  apps.editor.lazyvim.enable = true;
  apps.tools.direnv.enable = true;
  apps.tools.git.enable = true;
  apps.tools.zellij.enable = true;
}
