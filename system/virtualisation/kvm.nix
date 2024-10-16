{ pkgs, config, ... }:

let
  # Read the entire /proc/cpuinfo file
  cpuInfo = builtins.readFile "/proc/cpuinfo";

  # Extract the vendor_id using a regular expression
  # This regex captures the value after 'vendor_id\t: '
  vendorMatch = builtins.match "vendor_id\\s+:\\s+([A-Za-z0-9]+)" cpuInfo;

  # Determine the CPU vendor
  cpuVendor = if vendorMatch != null && vendorMatch != ""
    then builtins.head (builtins.elemAt vendorMatch 1)
    else "unknown";

  # Select the appropriate KVM module based on the CPU vendor
  kvmModule = if cpuVendor == "GenuineIntel"
    then "kvm_intel"
    else if cpuVendor == "AuthenticAMD"
      then "kvm_amd"
      else null;

in {
  # Enable virtualization support
  virtualisation.libvirtd = {
    enable = true;
    gui = true; # Enable virt-manager
  };

  # Conditional KVM module loading
  hardware.virtualisation.kvm = if kvmModule != null then {
    enable = true;
    modules = [ kvmModule ];
  } else {
    enable = false;
  };
}