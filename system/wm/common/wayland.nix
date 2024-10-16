{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.wayland
    pkgs.wl-clipboard
  ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    xkb = {
      variant = "";
      layout = "za";
    };

    displayManager.sddm = {
      enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.sddm;
    };
  };
}
