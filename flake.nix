{
    description = "Custom NixOs";

    outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
        settings = import (./. + "/settings.nix") {inherit pkgs;};
        pkgs = import nixpkgs {system = settings.system;};
    in {
        # NixOS configuration entrypoint.
        # 'nixos-rebuild switch --flake .#hostname
        nixosConfigurations = {
            ${settings.hostname} = nixpkgs.lib.nixosSystem {
                modules = [
                    inputs.stylix.nixosModules.stylix
                    inputs.catppuccin.nixosModules.catppuccin
                    (./. + "/profiles" + ("/" + settings.profile) + "/configuration.nix")
                ];
                specialArgs = {
                    inherit inputs;
                    inherit settings;
                };
            };
        };

        # Standalone home-manager configuration entrypoint.
        # 'home-manager switch --flake .#username
        homeConfigurations = {
            ${settings.username} = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${settings.system};
                modules = [
                    (./. + "/profiles" + ("/" + settings.profile) + "/home.nix")
                    inputs.stylix.homeManagerModules.stylix
                    inputs.catppuccin.homeManagerModules.catppuccin
                ];
                extraSpecialArgs = {
                    inherit inputs;
                    inherit settings;
                };
            };
        };
    };

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        ags.url = "github:Aylur/ags";
        hyprland.url = "github:hyprwm/Hyprland";
        aagl.url = "github:ezKEa/aagl-gtk-on-nix";
        aagl.inputs.nixpkgs.follows = "nixpkgs";
        stylix.url = "github:danth/stylix";
        swww.url = "github:LGFae/swww";
        hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            inputs.hyprland.follows = "hyprland";
        };
        catppuccin.url = "github:catppuccin/nix";
    };
}
