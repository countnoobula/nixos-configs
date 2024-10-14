{ pkgs, config, libs, ... }:

{
  #Nvidia settings for hybrid graphics(AMD video cores and Nvidia)
  # environment.systemPackages = [ "nvidia-offload" ]; 

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
    };

    nvidia = {
        open = false;

        #uses beta drivers
        package = config.boot.kernelPackages.nvidiaPackages.beta;

        #Fixes a glitch
        nvidiaPersistenced = true;
        nvidiaSettings = true;

        #Required for amdgpu and nvidia gpu pairings
        modesetting.enable = true;

        prime = {
            offload.enable = true;
            # sync.enable = true;
            amdgpuBusId = "PCI:7:0:0"; # Phoenix3
            nvidiaBusId = "PCI:1:0:0";
        };
    };
  };
}
