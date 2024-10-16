{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-liveshare.vsliveshare
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # Helpers
      "editorconfig.editorconfig@0.16.4"
      "github.copilot@1.238.0"
      "github.copilot-chat@0.21.2"

      # Containers
      "hashicorp.terraform@2.33.0"
      "ms-azuretools.vscode-docker@1.29.3"

      # CI
      "github.vscode-github-actions@0.27.0"

      # Collab
      "ms-vsliveshare.vsliveshare@1.0.5941"

      # Nix
      "pinage404.nix-extension-pack@3.0.0"
      "arrterian.nix-env-selector@1.0.11"

      # PHP
      "bmewburn.vscode-intelephense-client@1.12.6"
    ];
  };
}
