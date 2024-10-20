{ pkgs, lib, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # Helpers
      # {
      #   name = "editorconfig";
      #   publisher = "editorconfig";
      #   version = "0.16.4";
      #   sha256 = "sha256-j+P2oprpH0rzqI0VKt0JbZG19EDE7e7+kAb3MGGCRDk=";
      # }
      # {
      #   name = "copilot";
      #   publisher = "github";
      #   version = "1.238.0";
      #   sha256 = "sha256-9Vis8D4FJAHq+TKiqvhMmEVo26AGr63JRDmApLhmbx4=";
      # }
      # {
      #   name = "copilot-chat";
      #   publisher = "github";
      #   version = "0.21.2";
      #   sha256 = "sha256-DfS1R6sxAInx15uanDZo1ZKaedGM/qAi658SznO1C8I=";
      # }

      # # Trackers
      # {
      #   name = "vscode-wakatime";
      #   publisher = "WakaTime";
      #   version = "24.2.0";
      #   hash = "sha256-1AAerJsgmXJGiEOlxQRRo00JxYBm1Y8xI4rMQUcdv6k=";
      # }

      # # Containers
      # {
      #   name = "terraform";
      #   publisher = "hashicorp";
      #   version = "2.33.0";
      #   sha256 = "sha256-kkZOk2+9lvCMAbtCjdh5RquWhK90QR5LRAOOBQruWVw=";
      # }
      # {
      #   name = "vscode-docker";
      #   publisher = "ms-azuretools";
      #   version = "1.29.3";
      #   sha256 = "sha256-z0RqFos0ZG2Id/alUBZJyroX3coTcJ+x2R8v4FD2Zcg=";
      # }


      # # CI
      # {
      #   name = "vscode-github-actions";
      #   publisher = "github";
      #   version = "0.27.0";
      #   sha256 = "sha256-sZ831fPgy/HGsXL1gTezbTsnVcYjwxEd79JfMu1jaGo=";
      # }

      # # Collab
      # {
      #   name = "vsliveshare";
      #   publisher = "ms-vsliveshare";
      #   version = "1.0.5941";
      #   sha256 = "sha256-s7N6Qywq/SaubOOGw3+Rx1sl/Y1tHrtA2Cz8KiTB62I=";
      # }

      # # Nix
      # {
      #   name = "nix-ide";
      #   publisher = "jnoortheen";
      #   version = "0.3.5";
      #   sha256 = "sha256-hiyFZVsZkxpc2Kh0zi3NGwA/FUbetAS9khWxYesxT4s=";
      # }
      # {
      #   name = "nix-extension-pack";
      #   publisher = "pinage404";
      #   version = "3.0.0";
      #   sha256 = "sha256-cWXd6AlyxBroZF+cXZzzWZbYPDuOqwCZIK67cEP5sNk=";
      # }
      # {
      #   name = "nix-env-selector";
      #   publisher = "arrterian";
      #   version = "1.0.11";
      #   sha256 = "sha256-dK0aIH8tkG/9UGblNO0WwxJABBEEKEy4nSmIwdDpf4Q=";
      # }
    ];
    userSettings = {
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.colorTheme" = lib.mkForce "catppuccin-mocha";

      "editor.fontFamily" = lib.mkForce "Jetbrains Mono";
      "editor.fontLigatures" = true;

      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.formatterPath" = "nixpkgs-fmt";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "nixpkgs-fmt" ];
          };
        };
      };

      "git.enableCommitSigning" = false;
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 100;

      "powermode.enabled" = false; # stupid
      "powermode.combo.location" = "off";
      "powermode.combo.counterEnabled" = "hide";
      "powermode.shake.enabled" = false;
      "powermode.explosions.frequency" = 1;
      "powermode.combo.timerEnable" = "hide";
    };
  };
}
