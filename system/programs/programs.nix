{ pkgs, ... }:

{

  imports = [

  ];

  environment.systemPackages = with pkgs; [
    tmux curl git ripgrep
    zip unzip home-manager
    rsync strace gnupg pinentry lynis
    pciutils
  ];


}
