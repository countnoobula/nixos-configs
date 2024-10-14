{ config, pkgs, ... }:

{
  # Disable sleep and hibernation, these are not available in GUI
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;
}