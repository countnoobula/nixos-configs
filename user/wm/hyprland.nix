{ inputs, config, lib, settings, pkgs, hy3, ... }:

{
    imports = [
        ./hyprland/ags.nix
        ./hyprland/env.nix
        ./hyprland/binds.nix
        ./hyprland/scripts.nix
        ./hyprland/rules.nix
        ./hyprland/settings.nix
        ./hyprland/plugins.nix
        ./hyprland/hyprlock.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        systemd.enable = true;
        plugins = [
            pkgs.hyprlandPlugins.hyprexpo
            pkgs.hyprlandPlugins.hyprtrails
            pkgs.hyprlandPlugins.hyprscroller
            pkgs.hyprlandPlugins.hy3
        ];
    };
}
