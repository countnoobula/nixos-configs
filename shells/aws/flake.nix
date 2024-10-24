{
  description = "Nix shell for AWS";

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
          pkgs.awscli2
        ];

        shellHook = ''
          echo "Entering Java development environment"
          PATH="${pkgs.awscli2}/bin:$PATH"
        '';
      };
    });
}
