{ ... }:

{

  imports = [

  ];

  networking.hostName = "nixos"; # Define your hostname.

  #Systemd's NetworkD
  #systemd.network.enable = true;
  #systemd.network.networks."10-lan" = {
  #  matchConfig.Name = "enp8s0";
    # acquire a DHCP lease on link up
  #  networkConfig = { DHCP = "ipv4"; IPv6AcceptRA = true; };
    #this port is not always connected and not required to be online
  #  linkConfig.RequiredForOnline = "no";
  #};

  #Network Manager stuff
  networking.networkmanager.enable = true;
  #networking.networkmanager.unmanaged = [ "enp8s0" ];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.wireless.iwd.enable = true; #Enable wireless support via iNet wireless Daemon developed by Intel
  networking.networkmanager.wifi.backend = "iwd";
}

