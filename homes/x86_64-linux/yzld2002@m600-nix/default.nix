{ inputs, pkgs, system, lib, ... }: {
  apps.misc.enable = true;
  apps.shell.enable = true;
  apps.tools.direnv.enable = true;
  apps.tools.git.enable = true;
  apps.tools.zellij.enable = true;
  apps.editor.nvf.enable = true;
  apps.browser.edge.enable = true;
}
