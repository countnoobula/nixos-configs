{ config, pkgs, settings, ... }:

{
  imports =
    [
      # Window Manager
      (./. + "../../../user/wm/hyprland.nix")

      # Theme
      ../../themes/stylix.nix

      # Apps
      ../../user/apps/kitty.nix
      ../../user/apps/git.nix
      ../../user/apps/discord.nix
      ../../user/apps/android-studio.nix
      ../../user/apps/vscode.nix
      ../../user/apps/slack.nix
      ../../user/apps/thunar.nix
      ../../user/apps/google-chrome.nix
      ../../user/apps/gitkraken.nix
      ../../user/apps/jetbrains-toolbox.nix

      # Shell
      ../../user/shell/zsh.nix

      # Settings
      ../../user/settings/dconf.nix
    ];


  home.stateVersion = "24.05";
  stylix.targets.hyprland.enable = true;
  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  # Manage the Nix configuration file to enable experimental features
  home.file.".config/nix/nix.conf" = {
    text = ''
      # Enable experimental features for Nix
      experimental-features = nix-command flakes
    '';
  };

  home = {
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [];
    android_sdk.accept_license = true;
  };

  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip

    # utils
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq

    # networking tools
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    traceroute # trace network routing for breaks
    wget # alternative to curl

    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    sway-contrib.grimshot
    neofetch

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    htop  # system monitor
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    nwg-displays # display config

    # games
    ferium
  ];

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Media/Music";
    videos = "${config.home.homeDirectory}/Media/Videos";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    templates = null;
    desktop = null;
    publicShare = null;
    extraConfig = {
        XDG_DOTFILES_DIR = "${settings.dotfilesDir}";
        XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
    };
  };

  xdg.dataFile.icons = {
      source = ../../non-nix/icons;
      recursive = true;
  };

  home.sessionVariables = {
      EDITOR = settings.editor;
      TERM = settings.term;
      BROWSER = settings.browser;
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  wayland.windowManager.hyprland.settings.monitor = [
    "HDMI-A-1,2560x1080@60.0,730x1040,1.0"
    "DP-1,2560x1080@60.0,3290x1040,1.0"
    "DP-3,5120x1440@239.76,730x2120,1.0,bitdepth,10"
    # "DP-1, 2560x1080@60, 0x0, 1"
    # "HDMI-A-1, 2560x1080@60, 2560x0, 1"
    # "DP-3, 5120x1440@239.76, 1080x0, 1"
    ",preferred,auto,1"
  ];

  # environment.shells = with pkgs; [ zsh ];
  programs.direnv.enable = true;
}
