{pkgs, ...}:
rec {
    system = "x86_64-linux";
    hostname = "nixos"; # Hostname
    username = "countnoobula"; # Username
    profile = "wootbook"; # Select from profiles directory
    timezone = "Africa/Johannesburg"; # Select timezone
    locale = "en_ZA.UTF-8"; # Select locale
    name = "Shaun van Tonder"; # Name (git config)
    email = "shaunmichaelvantonder@gmail.com"; # Email (git config)
    dotfilesDir = "/home/${username}/.dotfiles"; # Absolute path of the local repo
    theme = "catppuccin"; # Selected theme from themes directory (./themes/)
    themeDetails = import (./. + "/themes/${theme}.nix") {dir = dotfilesDir;};
    wm = ["hyprland"]; # Selected window manager or desktop environment;

    font = "JetBrains Mono"; # Selected font
    fontPkg = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono"]; });
    fontSize = 12; # Font size

    icons = "Papirus";
    iconsPkg = pkgs.papirus-icon-theme;

    # Session variables.
    editor = "vim"; # Default editor
    editorPkg = pkgs.vim;
    browser = "google-chrome"; # Default browser; must select one from ./user/app/browser/
    browserPkg = pkgs.google-chrome;
    term = "kitty"; # Default terminal command
    termPkg = pkgs.kitty;
}
