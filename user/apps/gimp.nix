{ config, pkgs, settings, ...}:

{
  home.packages = [
    pkgs.gimp-with-plugins
  ];
}
