{ pkgs, config, libs, ... }:

{
  #Nvidia settings for hybrid graphics(AMD video cores and Nvidia)
  # environment.systemPackages = [ "nvidia-offload" ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    graphics = {
        enable = true;
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
    };
  };
}
