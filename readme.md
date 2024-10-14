# TL;DR:
```sh
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
sudo nix-channel --update

git clone https://github.com/Serpentian/AlfheimOS.git ~/.dotfiles
cd ~/.dotfiles
sudo nixos-generate-config --show-hardware-config > profiles/wootbook/hardware-configuration.nix
sudo nixos-rebuild switch --flake .
```

# issues
- sddm says can't find display pipe so need to find an alternative to boot into hyprland as gdm doesn't work

# credits
shout out to [Serpentian/AlfheimOS](https://github.com/Serpentian/AlfheimOS/) for most of the inspo and help from his files
