{ config, pkgs, settings, ...}:

{
  home.packages = [
    pkgs.slack
  ];
}