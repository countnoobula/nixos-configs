{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./custom-kernel.nix
  ];
}
