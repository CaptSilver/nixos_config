{ pkgs, ... }:

{

  imports = [

  ];

  environment.systemPackages = with pkgs; [
    obs-studio
    obs-studio-plugins.obs-vaapi
    obs-studio-plugins.input-overlay
  ];


}
