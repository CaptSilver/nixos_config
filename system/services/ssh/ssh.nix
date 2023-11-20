{ ... }:

{

  imports = [
  ];

  services.openssh = {
    enable = true;
    openFirewall = false;
  };

}
