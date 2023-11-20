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
      radeontop
#      vulkan-validation-layers  #having problems with building
    ];
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

}
