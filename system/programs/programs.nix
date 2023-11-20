{ pkgs, ... }:

{

  imports = [

  ];

  environment.systemPackages = with pkgs; [
    htop
    tmux curl git ripgrep
    zip unzip
    rsync strace gnupg pinentry lynis
    pciutils
  ];


}
