{ config, pkgs, settings, ...}:

{
  home.packages = [ pkgs.git ];

  programs.git = {
    enable = true;
    userName = settings.name;
    userEmail = settings.email;
    extraConfig = {
      core.editor = "vim";
    };
  };
}