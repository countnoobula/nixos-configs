{ config, pkgs, settings, ...}:

{
  home.packages = [
    pkgs.discord
    pkgs.vesktop
  ];
}
