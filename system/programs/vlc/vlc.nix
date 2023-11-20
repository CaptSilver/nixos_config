{ pkgs, ... }:

{

  imports = [

  ];

  networking.firewall.allowedTCPPorts = [ 8010 ];

  nixpkgs.overlays = [(
    self: super: {
      libbluray = super.libbluray.override {
        withAACS = true;
        withBDplus = true;
      };
    })
  ];

  environment.systemPackages = with pkgs; [
    vlc
    libvlc
  ];


}
