{ pkgs, lib, config, ... }:
    
{
    stylix = {
        enable = true;
        polarity = "dark";
        image = ../non-nix/wallpapers/evening-sky.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
        override = {
          base00 = "11111b";
        };
        opacity = {
            terminal = 0.8;
            applications = 0.8;
            desktop = 0.8;
            popups = 0.8;
        };
    };
}
