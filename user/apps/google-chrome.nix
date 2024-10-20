{ config, pkgs, settings, ...}:

{
  home.packages = [
    pkgs.google-chrome
  ];
}