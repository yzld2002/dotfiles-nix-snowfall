{ pkgs, modulesPath, ... }: {
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix") ./hardware.nix ./disk.nix ];

  # Enable Bootloader
  system.boot.efi.enable = true;

  suites.server.enable = true;

  networking.interfaces.ens18.useDHCP = false;
  networking.interfaces.ens18.ipv4.routes = [{
    address = "192.168.50.21";
    prefixLength = 24;
    via = "192.168.50.1";
  }];

  # ======================== DO NOT CHANGE THIS ========================
  system.stateVersion = "24.05";
  # ======================== DO NOT CHANGE THIS ========================
}
