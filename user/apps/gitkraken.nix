{ config, pkgs, settings, ...}:

{
  home.packages = [
    pkgs.gitkraken
  ];
}