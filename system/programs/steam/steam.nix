{ config, pkgs, lib, ... }:

{

  imports = [

  ];

  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override ({ extraPkgs ? pkgs': [ ], ... }: {
        extraPkgs = pkgs': (extraPkgs pkgs') ++ (with pkgs'; [ libgdiplus ]);
      });
    })
  ];
  systemd.extraConfig = "DefaultLimitNOFILE=1048576";
  hardware.opengl.driSupport32Bit = true; # Enables support for 32bit libs that steam uses
  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    wine
    winetricks
#    wineWowPackages.waylandFull
  ];
}
