{ pkgs, ... }:

{

  imports = [

  ];

  environment.systemPackages = with pkgs; [
    gimp-with-plugins
  ];


}
