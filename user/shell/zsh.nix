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

    initExtra = ''
      . "$HOME/.dotfiles/non-nix/zsh/session-vars.sh"
      . "$HOME/.dotfiles/non-nix/zsh/z.sh"
    '';

    shellAliases = {
      ll = "ls -lah";

      nix-android = "NIXPKGS_ALLOW_INSECURE=1 nix develop ${settings.dotfilesDir}/shells/android -c zsh --impure";
      nix-aws = "nix develop ${settings.dotfilesDir}/shells/aws -c zsh";
      nix-dotnet = "nix develop ${settings.dotfilesDir}/shells/dotnet -c zsh";
      nix-java = "nix develop ${settings.dotfilesDir}/shells/java -c zsh";
      nix-nodejs = "nix develop ${settings.dotfilesDir}/shells/nodejs -c zsh";
      nix-php = "nix develop ${settings.dotfilesDir}/shells/php -c zsh";
      nix-python = "nix develop ${settings.dotfilesDir}/shells/python -c zsh";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  home.packages = with pkgs; [
    eza
    btop
  ];
}
