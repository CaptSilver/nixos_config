{ pkgs, ... }:

{

  imports = [

  ];

  environment.systemPackages = with pkgs; [
    tor-browser-bundle-bin
  ];


}
