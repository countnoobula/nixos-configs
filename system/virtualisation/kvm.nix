{ pkgs, config, ... }:

{
  # Enable virtualization support
  virtualisation.libvirtd = {
    enable = true;
    gui = true; # Enable virt-manager
  };
}
