
{ options, config, lib, pkgs, ... }:
with lib;
with lib.custom;
let cfg = config.desktop.input;
in {
  options.desktop.input = with types; { enable = mkBoolOpt false "Enable Fcitx Input Method"; };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      fcitx5
      fcitx5-chinese-addons
      fcitx5-configtool
      fcitx5-gtk
    ];
    environment.sessionVariables = {
      GTK_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
    };
  };
}
