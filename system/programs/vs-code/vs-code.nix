{ pkgs, ... }:

{

  imports = [

  ];

  environment.systemPackages = with pkgs; [
    vscode-with-extensions
  ];


}
