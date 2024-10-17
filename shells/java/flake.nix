{
  description = "Nix shell for Java";

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
          pkgs.jdk11
        ];

        shellHook = ''
          echo "Entering Java development environment"
          PATH="${pkgs.jdk11}/bin:$PATH"
        '';
      };
    });
}
