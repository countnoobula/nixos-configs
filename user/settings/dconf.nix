{ config, pkgs, ... }:

{
  # Enable the dconf module
  programs.dconf.enable = true;

  # Import your dconf settings from a directory or define them inline
  # Example: Import from a directory containing key files
  programs.dconf.settings = {
    # virt-manager settings
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
