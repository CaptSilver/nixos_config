{ pkgs, ... }:

{

  imports = [

  ];

  environment.systemPackages = with pkgs; [
    protonup-qt
  ];


}
