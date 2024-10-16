{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.wayland
    pkgs.wl-clipboard
    pkgs.catppuccin-sddm
  ];

  services.xserver = {
    enable = true;
    xkb = {
      variant = "";
      layout = "za";
    };

    displayManager = {
      sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
        theme = "catppuccin-mocha";

        wayland = {
          enable = true;
        };
      };

      autoLogin.enable = false;

      gdm.enable = false;
      lightdm.enable = false;
    };
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
