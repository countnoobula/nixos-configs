{ inputs, config, pkgs, ... }:

{
  imports = [
    ./common/wayland.nix
    ./common/fonts.nix
  ];

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gedit
  ]) ++ (with pkgs.gnome; [
    #        cheese # webcam tool
    #        gnome-music
    #        epiphany # web browser
    #        geary # email reader
    #        evince # document viewer
    #        gnome-characters
    #        totem # video player
    #        tali # poker game
    #        iagno # go game
    #        hitori # sudoku game
    #        atomix # puzzle game
  ]);

  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
  ];
}
