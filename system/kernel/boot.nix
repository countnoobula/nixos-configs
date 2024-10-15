{ config, pkgs, ... }:

{
  # Kernel.
  boot.kernelPatches = [
    {
      name = "irq-patch";
      patch = ./acpi_override.patch;
    }
  ];
}
