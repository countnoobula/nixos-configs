{ config, pkgs, ... }:

{
  dconf.settings = {
    # virt-manager settings
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
