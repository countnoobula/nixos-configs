{ pkgs, config, ... }:

{
  # File explorer
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
    ];
  };

  services.tumblr.enable = true;
  services.gvfs.enable = true;
}
