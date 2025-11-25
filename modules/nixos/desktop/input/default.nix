
{ options, config, lib, pkgs, ... }:
with lib;
with lib.custom;
let cfg = config.desktop.input;
in {
  options.desktop.input = with types; { enable = mkBoolOpt false "Enable Fcitx Input Method"; };
  config = mkIf cfg.enable {
    i18n.inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5.addons = with pkgs; [
        fcitx5-chinese-addons
        fcitx5-gtk
        catppuccin-fcitx5
      ];
      fcitx5.waylandFrontend = true;
    };
  };
}
