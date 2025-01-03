{ config, pkgs, settings, lib, inputs, ... }: let
    details = settings.themeDetails;
in {
  home.packages = with pkgs; [
    inputs.swww.packages.${pkgs.system}.swww
  ];

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "swww-daemon &"
      "ags &"
      # "hyprctl setcursor Catppuccin-Mocha-Lavender-Cursors 24"
      "[workspace 1 silent] google-chrome"
      "[workspace 2 silent] kitty btop"
    ];

    general = lib.mkForce {
      gaps_in = 4;
      gaps_out = 8;
      border_size = 2;
      allow_tearing = true;
      "col.active_border" = "rgba(${config.lib.stylix.colors.base0D}ff)";
      "col.inactive_border" = "rgba(${config.lib.stylix.colors.base02}ff)";
      # "layout" = "scroller";
    };

    decoration = lib.mkForce {
      dim_special = 0.5;
      rounding = details.rounding;
      blur = {
        enabled = true;
        special = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.02;
        passes = 3;
        size = 10;
      };

      drop_shadow = details.shadow;
      shadow_ignore_window = false;
      shadow_offset = "2 2";
      shadow_range = 20;
      # "col.shadow" = "rgba(${config.lib.stylix.colors.base00}ff)";
    };

    animations = {
      enabled = true;
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
        "workIn, 0.72, -0.07, 0.41, 0.98"
      ];
      animation = [
        "windows, 1, 6, wind, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 1, liner"
        "borderangle, 1, 30, liner, loop"
        "fade, 1, 10, default"
        "workspaces, 1, 5, wind"
        "specialWorkspace, 1, 5, workIn, slidevert"
      ];
    };

    debug = {
        disable_logs = false;
    };

    input = {
      kb_layout = "us";
      kb_options = "grp:win_space_toggle";
      follow_mouse = true;
      touchpad = {
          natural_scroll = true;
      };
    };

    device = {
        name = "logitech-usb-receiver-mouse";
        sensitivity = -0.7;
    };

    gestures = {
        workspace_swipe = true;
        workspace_swipe_distance = 200;
    };

    dwindle = {
      # keep floating dimentions while tiling
      pseudotile = true;
      preserve_split = true;
      force_split = 2;
      split_width_multiplier = 1.5;
    };

    misc = {
      force_default_wallpaper = -1;
      vrr = 2;
    };
  };
}
