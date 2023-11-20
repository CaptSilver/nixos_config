{ pkgs, ... }:

{

  imports = [

  ];

  environment.systemPackages = with pkgs; [

    libreoffice-qt
    hunspell

    ];
}
