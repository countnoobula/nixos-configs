{
  description = "Nix shell for PHP development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    phps.url = "github:loophp/nix-shell";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          inputs.phps.overlays.default
        ];
      };
    in
    {
      devShells.default = pkgs.mkShell {
        php = pkgs.api.buildPhpFromComposer {
          php = pkgs.php83;
          src = inputs.self;
          withExtensions = ["xdebug" "opcache"];
        };

        packages = [
          php
          php.packages.composer
        ];

        shellHook = ''
          echo "Entering PHP development environment"
          if [ ! -f composer.lock ]; then
            composer install
          fi
        '';

        hardeningDisable = [ "fortify" ];
      };
    });
}
