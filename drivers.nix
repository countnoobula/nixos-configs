{ config, pkgs, ... }:

{
  imports = [
    ./nixos-hardware/common/pc/laptop
    ./nixos-hardware/common/pc/ssd
    ./nixos-hardware/tuxedo/infinitybook/v4
    ./nvidia.nix
  ];
}
