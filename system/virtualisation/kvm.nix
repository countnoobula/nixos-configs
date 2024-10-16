{ pkgs, config, ... }:

{
  # Enable virtualization support
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
