{
  description = "Nix shell for Android development";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.git
            pkgs.gnupg
            pkgs.python2
            pkgs.curl
            pkgs.procps
            pkgs.openssl
            pkgs.gnumake
            pkgs.nettools
            pkgs.androidenv.androidPkgs.platform-tools
            pkgs.jdk
            pkgs.schedtool
            pkgs.util-linux
            pkgs.m4
            pkgs.gperf
            pkgs.perl
            pkgs.libxml2
            pkgs.zip
            pkgs.unzip
            pkgs.bison
            pkgs.flex
            pkgs.lzop
            pkgs.python3
            pkgs.zsh
            pkgs.androidsdk
            pkgs.androidndk
            pkgs.gradle
            pkgs.nodejs
            pkgs.yarn
            pkgs.git-lfs
          ];

          shellHook = ''
            export ALLOW_NINJA_ENV=true
            export USE_CCACHE=1
            export ANDROID_JAVA_HOME=${pkgs.jdk}
            export ANDROID_HOME=${pkgs.androidsdk}
            export ANDROID_NDK_HOME=${pkgs.androidndk}
            export LD_LIBRARY_PATH=/usr/lib:/usr/lib32
            export PATH=${pkgs.androidsdk}/cmdline-tools/latest/bin:${pkgs.androidsdk}/platform-tools:$PATH

            # Reminder to accept SDK licenses
            if [ ! -f "$ANDROID_HOME/.licenses/android-sdk-license" ]; then
              echo "Please accept the Android SDK licenses by running:"
              echo "sdkmanager --licenses"
            fi

            echo "Android development environment is ready."
          '';

          # Set default shell to zsh
          shell = pkgs.zsh;
        };
      }
    );
}
