{ pkgs ? import <nixpkgs> {} }:

pkgs.linuxPackages.kernel.overrideAttrs (oldAttrs: {
  name = oldAttrs.name + "-custom";
  patches = oldAttrs.patches ++ [ ./acpi_override.patch ];
})
