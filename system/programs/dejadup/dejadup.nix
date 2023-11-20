{ pkgs, ... }:

{

  imports = [

  ];

  environment.systemPackages = with pkgs; [
    deja-dup
  ];


}
