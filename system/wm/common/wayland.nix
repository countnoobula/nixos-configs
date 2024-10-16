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

    displayManager = {
      lightdm = {
        enable = true;
        greeters = {
          gtk = {
            enable = true;
            theme.name = "Adwaita";
            iconTheme.name = "Papirus";
          };
        };
        extraConfig = ''
          [Seat:*]
          user-session=hyprland
          log-level=debug
        '';
      };
    };
  };

  environment.etc."wayland-sessions/hyprland.desktop" = {
    source = pkgs.writeText "hyprland.desktop" ''
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
