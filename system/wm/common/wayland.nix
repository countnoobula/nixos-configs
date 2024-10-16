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

    displayManager = {
      lightdm = {
        enable = true;
        theme = "breeze";
        package = pkgs.lightdm;
        greeters = {
          gtk = {
            enable = true;
            theme.name = "Adwaita";
            iconTheme.name = "Papirus";
          };
        };
      };
      # sddm = {
      #   enable = true;
      #   theme = "catppuccin-mocha";
      #   package = pkgs.sddm;
      # };
    };
  };

  # Create a Hyprland Session for SDDM
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
