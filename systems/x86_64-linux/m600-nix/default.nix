{ pkgs, modulesPath, ... }: {
  imports =
    [ ./hardware.nix ./disk.nix ];

  # Enable Bootloader
  system.boot.efi.enable = true;

  suites.server.enable = true;
  suites.gui.enable = true;

  networking.interfaces.wlp4s0.useDHCP = false;
  networking.interfaces.wlp4s0.ipv4.addresses = [{
    address = "192.168.50.20";
    prefixLength = 24;
  }];
  networking.defaultGateway = "192.168.50.1";
  networking.nameservers = [ "192.168.50.1" ];
  networking.firewall = {
    enable = false;
    allowedTCPPorts = [ 80 443 3000 ];
    allowedUDPPortRanges = [
      {
        from = 4000;
        to = 4007;
      }
      {
        from = 8000;
        to = 8010;
      }
    ];
  };

  # ======================== DO NOT CHANGE THIS ========================
  system.stateVersion = "24.05";
  # ======================== DO NOT CHANGE THIS ========================
}
