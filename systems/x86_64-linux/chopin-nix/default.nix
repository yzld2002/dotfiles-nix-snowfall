{pkgs, modulesPath, ...}: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    ./hardware.nix
    ./disk.nix
  ];

  # Enable Bootloader
  system.boot.efi.enable = true;

  suites.server.enable = true;

  # ======================== DO NOT CHANGE THIS ========================
  system.stateVersion = "24.05";
  # ======================== DO NOT CHANGE THIS ========================
}
