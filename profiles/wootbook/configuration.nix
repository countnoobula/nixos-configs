{ config, pkgs, settings, ... }:

{
  imports = 
    [
      ./hardware-configuration.nix

      # Kernel
      ../../system/kernel

      # Drivers
      ../../system/hardware
      
      # Apps
      ../../system/apps/cron.nix
      ../../system/apps/steam.nix

      # Power Options
      ../../system/power/nosleep.nix

      # Security
      ../../system/security/firewall.nix

      # Docker
      ../../virtualisation/docker.nix

      # Window manager
      (./. + "../../../system/wm"+("/" + builtins.elemAt settings.wm 0)+".nix")
    ];

  # Enable this for proprietary drivers [Looking at you Atheros Bluetooth]
  hardware.enableRedistributableFirmware = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Networking
  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Time
  time.timeZone = settings.timezone;
  i18n.defaultLocale = settings.locale;

  # Users
  users.users.${settings.username} = {
      isNormalUser = true;
      description = settings.username;
      extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  # Set shell
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # List of globally installed packages.
  environment.systemPackages = with pkgs; [
    home-manager
    nix-index
    pciutils
    go-mtpfs
    ntfs3g
    inetutils
    lsof
    wget
    git
    vim
  ];

  services.gvfs.enable = true;

  programs.direnv.enable = true;
}