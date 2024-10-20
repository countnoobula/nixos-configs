{ config, pkgs, settings, ...}:

{
  home.packages = [
    pkgs.jetbrains-toolbox
  ];
}