{ config, pkgs, ... }:

{
  # Kernel.
  boot.kernelPatches = [
    {
      name = "irq-patch";
      patch = ./kernel/acpi_override.patch;
    }
  ];
}
