{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./boot.nix
    ./graphics.nix
    # ./input.nix
    ./printing.nix
    ./sound.nix
    ./ssd.nix
  ];
}
