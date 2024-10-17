{ config, pkgs, ... }:

{
  imports = [
    ./acpi_patch.nix
  ];
}
