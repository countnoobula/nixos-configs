{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # ms-liveshare.vsliveshare
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # Helpers
      {
        publisher = "editorconfig";
        name = "editorconfig";
        version = "0.16.4";
      }
      {
        publisher = "github";
        name = "copilot";
        version = "1.238.0";
      }
      {
        publisher = "github";
        name = "copilot-chat";
        version = "0.21.2";
      }

      # Containers
      {
        publisher = "hashicorp";
        name = "terraform";
        version = "2.33.0";
      }
      {
        publisher = "ms-azuretools";
        name = "vscode-docker";
        version = "1.29.3";
      }

      # CI
      {
        publisher = "github";
        name = "vscode-github-actions";
        version = "0.27.0";
      }

      # Collab
      {
        publisher = "ms-vsliveshare";
        name = "vsliveshare";
        version = "1.0.5941";
      }

      # Nix
      {
        publisher = "pinage404";
        name = "nix-extension-pack";
        version = "3.0.0";
      }
      {
        publisher = "arrterian";
        name = "nix-env-selector";
        version = "1.0.11";
}

      # PHP
      {
        publisher = "bmewburn";
        name = "vscode-intelephense-client";
        version = "1.12.6";
    }];

  };
}
