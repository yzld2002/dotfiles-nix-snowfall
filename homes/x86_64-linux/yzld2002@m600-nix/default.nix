{
  inputs,
  pkgs,
  system,
  lib,
  ...
}: {
  apps.misc.enable = true;
  apps.shell.zsh.enable = true;
  apps.editor.lazyvimnix.enable = true;
  apps.browser.edge.enable = true;
  apps.terminal.ghostty.enable = true;
  apps.tools.direnv.enable = true;
  apps.tools.git.enable = true;
  apps.tools.zellij.enable = true;
}
