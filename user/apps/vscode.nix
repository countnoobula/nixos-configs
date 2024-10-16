{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # Helpers
      {
        name = "editorconfig";
        publisher = "editorconfig";
        version = "0.16.4";
        sha256 = "sha256-dZunfGPgEEppvRHLgr1IzBjgJi1LgYgy5Lkaox/vHhU=";
      }
      {
        name = "copilot";
        publisher = "github";
        version = "1.238.0";
        sha256 = "sha256-6L9Me/1Rr81fHuIzbL08BsrhkUKRxorgNYoZ3kKBkIQ=";
      }
      {
        name = "copilot-chat";
        publisher = "github";
        version = "0.21.2";
        sha256 = "sha256-n66vaKacCZuFOqZsbRdjH9H7JMXo0+IlYgGQiMj1eME=";
      }

      # Trackers
      {
        name = "vscode-wakatime";
        publisher = "WakaTime";
        version = "24.2.0";
        hash = "sha256-1AAerJsgmXJGiEOlxQRRo00JxYBm1Y8xI4rMQUcdv6k=";
      }

      # Containers
      {
        name = "terraform";
        publisher = "hashicorp";
        version = "2.33.0";
        sha256 = "sha256-FXYppKNvHnmXc/lO6jzaW1tp7//d/AJf/SCOZp8jouI=";
      }
      {
        name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "1.29.3";
        sha256 = "sha256-8Ku4z5NtqSv7/fGoAKAlrHaUEyfJGv1YgeUTSZSG5gw=";
      }


      # CI
      {
        name = "vscode-github-actions";
        publisher = "github";
        version = "0.27.0";
        sha256 = "sha256-2pnFKp97Xjnb94cvQoRbhGIp4cb4t/vG8sa/QayiiHs=";
      }

      # Collab
      {
        name = "vsliveshare";
        publisher = "ms-vsliveshare";
        version = "1.0.5941";
        sha256 = "sha256-82QGemd//SbeV/ckfk/kdeD+NPK3XbyxfuZHRNdjUlc=";
      }

      # Nix
      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.3.5";
        sha256 = "sha256-uR5rRctC6mpSlOPeQ2MRnJ2xiVYum2Dtxx2/rh2JycM=";
      }
      {
        name = "nix-extension-pack";
        publisher = "pinage404";
        version = "3.0.0";
        sha256 = "sha256-QBV+NltSO1dshx1BUdoTqJX3O0zPqHJsrQBv/QPoTdg=";
      }
      {
        name = "nix-env-selector";
        publisher = "arrterian";
        version = "1.0.11";
        sha256 = "sha256-xmBUdPU1z26qKLUWcqEyOjiZUsFVHePYsgrqOTOSpXQ=";
      }
    ];
    userSettings = {
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.colorTheme" = "Mayukai Semantic Mirage";

      "editor.fontFamily" = "Jetbrains Mono";
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
