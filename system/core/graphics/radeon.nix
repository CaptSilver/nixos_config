{ pkgs, ... }:

{

  imports = [

  ];

  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocmPackages.rocm-runtime
    amdvlk
  ];

}
