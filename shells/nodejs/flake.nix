{
  description = "Nix shell for JavaScript";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.nodejs-18_x
          pkgs.yarn
        ];

        shellHook = ''
          echo "Entering JavaScript development environment"
          if [ ! -d node_modules ]; then
            yarn install || npm install
          fi
        '';

        hardeningDisable = [ "fortify" ];
      };
    });
}
