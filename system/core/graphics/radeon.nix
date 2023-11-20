{ pkgs, lib, ... }:

{

  imports = [

  ];

  hardware.opengl = {
    enable = true;
    driSupport = lib.mkDefault true;
    driSupport32Bit = lib.mkDefault true;
    extraPackages = with pkgs; [
      rocm-opencl-icd
      rocmPackages.rocm-runtime
      amdvlk
      driversi686Linux.amdvlk
      radeontop nvtop-amd
      vulkan-tools
      wayland-utils
#      vulkan-validation-layers  #having problems with building
      libva-utils
      glxinfo
      clinfo
    ];
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

}
