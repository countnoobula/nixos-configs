# TL;DR:
```sh
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
sudo nix-channel --add https://github.com/catppuccin/nix/archive/main.tar.gz catppuccin
sudo nix-channel --update

git clone https://github.com/countnoobula/nixos-configs.git ~/.dotfiles
cd ~/.dotfiles
sudo nixos-generate-config --show-hardware-config > profiles/wootbook/hardware-configuration.nix
sudo nixos-rebuild switch --flake .
```

# credits
shout out to [Serpentian/AlfheimOS](https://github.com/Serpentian/AlfheimOS/) for most of the inspo and help from his files
