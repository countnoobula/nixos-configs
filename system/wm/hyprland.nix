{ inputs, config, pkgs, ... }:

{
  imports = [
    ./common/wayland.nix
    ./common/fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      # package = inputs.hyprland.packages.${pkgs.system}.default;
      # portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # Support for Electron apps
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal= true;
    config = {
      # common.default = ["gtk"];
      hyprland.default = ["hyprland"];
    };

    extraPortals = [
      # pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
  };
}
