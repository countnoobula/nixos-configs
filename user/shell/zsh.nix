{ settings, config, pkgs, ... }:

{
  imports = [
      ./starship.nix
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -lah";
      nix-python = "nix develop ${settings.dotfilesDir}/shells/python -c zsh";
      nix-android = "nix develop ${settings.dotfilesDir}/shells/android -c zsh";
      nix-nodejs = "nix develop ${settings.dotfilesDir}/shells/nodejs -c zsh";
      nix-php = "nix develop ${settings.dotfilesDir}/shells/php -c zsh";
      nix-dotnet = "nix develop ${settings.dotfilesDir}/shells/dotnet -c zsh";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
  };

  home.packages = with pkgs; [
    eza
    btop
  ];
}
