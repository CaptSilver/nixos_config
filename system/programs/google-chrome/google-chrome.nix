{ pkgs, ... }:

{

  imports = [

  ];

  environment.systemPackages = with pkgs; [
    google-chrome
  ];
}
