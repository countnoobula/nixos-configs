{
  description = "Nix shell for .NET Core development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in flake-utils.lib.eachDefaultSystem (system: {
      packages.default = pkgs.mkShell {
        packages = [
          (with dotnetCorePackages; combinePackages [
            dotnetCorePackages.sdk_7_0
            dotnetPackages.Nuget
          ])
        ];

        shellHook = ''
          echo "Entering .NET Core development environment"
        '';

        hardeningDisable = [ "fortify" ]; # Optional, depending on your needs
      };
    });
}
