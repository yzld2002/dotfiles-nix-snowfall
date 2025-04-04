{ options, config, lib, pkgs, ... }:
with lib;
with lib.custom;
let cfg = config.suites.gui;
in {
  options.suites.gui = with types; {
    enable = mkBoolOpt false "Enable the gui suite";
  };

  config = mkIf cfg.enable {
    system.nix.enable = true;

    hardware.audio.enable = true;
    hardware.networking.enable = true;

    # hardware.bluetooth.enable = true;
    # hardware.bluetooth.settings = {
    #   General = {
    #     FastConnectable = true;
    #     JustWorksRepairing = "always";
    #     Privacy = "device";
    #   };
    #   Policy = {
    #     AutoEnable = true;
    #   };
    # };

    services.ssh.enable = true;
    programs.dconf.enable = true;

    environment.systemPackages = [ pkgs.bluetuith pkgs.custom.sys ];

    system = {
      fonts.enable = true;
      locale.enable = true;
      time.enable = true;
      xkb.enable = true;
    };
  };
}
