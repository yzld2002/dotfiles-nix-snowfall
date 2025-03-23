{ options, config, lib, pkgs, ... }:
with lib;
with lib.custom;
let cfg = config.suites.server;
in {
  options.suites.server = with types; {
    enable = mkBoolOpt false "Enable the server suite";
  };

  config = mkIf cfg.enable {
    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [ custom.sys gnumake ];

    system = {
      nix.enable = true;
      locale.enable = true;
      time.enable = true;
    };
    services.ssh.enable = true;
  };
}
