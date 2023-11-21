{ pkgs, lib, config, options, ... }:

{  #Cups support is still failing but everything else is working!
   #LDD shows no cups support built in package, NixOS still wants to install the regular Samba package.
  imports = [  ];

  users = {
    groups.samba = {};
    users.samba = {
      isSystemUser = true;
      description = "Residence of our Samba guest users";
      group = "samba";
      home = "/var/empty";
      createHome = false;
      shell = pkgs.shadow;
      extraGroups = ["samba"];
    };
  };


  networking.firewall.allowedTCPPorts = [ 445 139 5357 631]; #Samba, mDNS/Avahi
  networking.firewall.allowedUDPPorts = [ 137 138 3702 631];

  environment.systemPackages = with pkgs; [ cifs-utils sambaFull ];

  services.samba-wsdd.enable = true; # make shares visible for windows 10 clients

  services.samba= {

    enable = true; #Installing a samba without CUPS support, :(
    package = pkgs.sambaFull;
    openFirewall = true; #This may work... I opened the firewall ports manually just in case.
    securityType = "user";
    extraConfig = ''
      workgroup = WORKGROUP
      server string = alien
      netbios name = alien
      hosts allow = 192.168.1. 127.0.0.1 localhost
      hosts deny = 0.0.0.0/0
      invalid users = root
      logging = systemd
      log level = 1
      max log size = 5000
      guest account = samba
      map to guest = bad user
    '';

    shares = {
      alien-public  = {
        path = "/home/dave/Public";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "writable" = "yes";
        "create mask" = "0777";
        "directory mask" = "0777";
        "force user" = "samba";
        "force group" = "samba";
      };
      alien-private = {
        path = "/home/dave/Downloads";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0664";
        "directory mask" = "0755";
        "force user" = "samba";
        "force group" = "samba";
      };
      printers = {
        comment = "All Printers";
        path = "/var/spool/samba";
        public = "yes";
        browseable = "yes";
        # to allow user 'guest account' to print.
        "guest ok" = "yes";
        writable = "no";
        printable = "yes";
        "create mode" = 0700;
      };
    };
  };

  # mDNS

  services.avahi = {
    enable = true;
    openFirewall = true;
    nssmdns = true;
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
    extraServiceFiles = { #Can't see samba shares without this...
      smb = ''
        <?xml version="1.0" standalone='no'?><!--*-nxml-*-->
        <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
        <service-group>
          <name replace-wildcards="yes">%h</name>
          <service>
            <type>_smb._tcp</type>
            <port>445</port>
          </service>
        </service-group>
      '';
    };
  };

  systemd.tmpfiles.rules = [ #This will make sure perms are set!
    "d /var/spool/samba 1777 root root -"
    "d /home/dave 0711 dave users -" #Must have execute bit in other to enter home dir. Sticky bit shouldn't be necessary.
    "d /home/dave/Public 1771 dave samba -"
    "d /home/dave/Downloads 1771 dave samba -"
  ];
}
