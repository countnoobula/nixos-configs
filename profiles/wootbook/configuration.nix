{ config, pkgs, settings, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      # Kernel
      ../../system/kernel

      # Drivers
      ../../system/hardware
      ../../system/hardware/input.nix

      # Apps
      ../../system/apps/cron.nix
      ../../system/apps/steam.nix
      ../../system/apps/lutris.nix

      # Power Options
      ../../system/power/nosleep.nix

      # Security
      ../../system/security/firewall.nix

      # Virtualization
      ../../system/virtualisation/docker.nix
      ../../system/virtualisation/kvm.nix

      # Window manager
      ../../system/wm/hyprland.nix

      # Hardware packages
      <nixos-hardware/common/pc/laptop>
      <nixos-hardware/common/pc/ssd>
      <nixos-hardware/tuxedo/infinitybook/v4>
    ];

  system.stateVersion = "24.05";

  # Enable this for proprietary drivers [Looking at you Atheros Bluetooth]
  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Networking
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Disable powermanagement
  powerManagement = {
    enable = false;
    powertop.enable = false;
  };
  services.tlp = {
    enable = true;
    settings = {
      PLATFORM_PROFILE_ON_AC="performance";
      PLATFORM_PROFILE_ON_BAT="balanced";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_BOOST_ON_AC=1;
      CPU_BOOST_ON_BAT=0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_BAT = 30;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_DRIVER_OPMODE_ON_AC="active";
      CPU_DRIVER_OPMODE_ON_BAT="active";
      STOP_CHARGE_THRESH_BAT1 = 80;
      USB_AUTOSUSPEND=0;
      USB_BLACKLIST_WWAN=1;
      WIFI_PWR_ON_AC="off";
      WIFI_PWR_ON_BAT="off";
      RESTORE_DEVICE_STATE_ON_STARTUP=0;
      USB_ALLOWLIST="13d3:3585"; # Bluetooth
      USB_EXCLUDE_BTUSB=1;
      USB_EXCLUDE_PHONE=1;
      RUNTIME_PM_BLACKLIST="13d3:3585";
    };
    # extraConfig = ''
  	#   USB_AUTOSUSPEND=0
    # '';
  };

  # Time
  time.timeZone = settings.timezone;
  i18n.defaultLocale = settings.locale;

  # Users
  users.users.${settings.username} = {
      isNormalUser = true;
      description = settings.username;
      extraGroups = [ "networkmanager" "wheel" "docker" "kvm" "adbusers" "libvirtd" "video" ];
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
    acpi
    wget
    git
    vim
  ];

  # The thumbnail service for Thunar
  services.tumbler = {
    enable = true;
    # plugins = [ "pdf" "ffmpegthumbnailer" "jpeg" ];
  };

  # OpenSSH for easier config
  services.openssh.enable = true;
  services.openssh.settings = {
    PasswordAuthentication = true;
  };

  # Nvidia Prime
  hardware.nvidia.prime = {
    offload.enable = true;
    # sync.enable = true;
    amdgpuBusId = "PCI:7:0:0"; # Phoenix3
    nvidiaBusId = "PCI:1:0:0";
  };

  programs.direnv.enable = true;
}
