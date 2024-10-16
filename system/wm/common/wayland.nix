{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.wayland
    pkgs.wl-clipboard
  ];

  services.xserver = {
    enable = true;
    xkb = {
      variant = "";
      layout = "za";
    };

    displayManager.autoLogin.enable = false;
  };

  displayManager = {
    sddm = {
      enable = true;

      wayland = {
        enable = true;
      };
    };

    defaultSession = "Hyprland";
    gdm.enable = false;
    lightdm.enable = false;
  };

  environment.etc."wayland-sessions/Hyprland.desktop" = {
    source = pkgs.writeText "Hyprland.desktop" ''
      [Desktop Entry]
      Name=Hyprland
      Comment=Hyprland Wayland Compositor
      Exec=Hyprland
      Type=Application
      DesktopNames=Hyprland
      Keywords=tiling;wm;compositor;wayland;
    '';
    mode = "0644";
  };
}
