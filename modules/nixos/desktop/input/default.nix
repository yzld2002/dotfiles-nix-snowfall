
{ options, config, lib, pkgs, ... }:
with lib;
with lib.custom;
let cfg = config.desktop.input;
in {
  options.desktop.input = with types; { enable = mkBoolOpt false "Enable Fcitx Input Method"; };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kdePackages.fcitx5-with-addons
      kdePackages.fcitx5-chinese-addons
    ];
  };
}
