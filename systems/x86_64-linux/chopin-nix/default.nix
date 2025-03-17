{pkgs, modulesPath, ...}: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    ./hardware.nix
    ./disk.nix
  ];

  # Enable Bootloader
  system.boot.efi.enable = true;

  environment.systemPackages = with pkgs; [
    # Any particular packages only for this host
    fastfetch
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    # change this to your ssh key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG3dHygJrJv/ZqC1Y8NhpghQK4hMTuacdJhcXtvfG7dN yzld2002@gmail.com"
  ];

  # ======================== DO NOT CHANGE THIS ========================
  system.stateVersion = "24.05";
  # ======================== DO NOT CHANGE THIS ========================
}
