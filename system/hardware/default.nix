{ config, pkgs, ... }:

{
  imports = [
    <nixos-hardware/common/pc/laptop>
    <nixos-hardware/common/pc/ssd>
    <nixos-hardware/tuxedo/infinitybook/v4>
    
    ./bluetooth.nix
    ./boot.nix
    ./graphics.nix
    ./input.nix
    ./printing.nix
    ./sound.nix
  ];
}
