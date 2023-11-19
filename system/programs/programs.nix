{ pkgs, ... }:

{

  imports = [

  ];

  environment.systemPackages = with pkgs; [
#    nix-gaming.packages.${pkgs.hostPlatform.system}.wine-ge
    discord yakuake wireguard-tools
    firefox kate htop
    libreoffice-qt
    hunspell hunspellDicts.uk_UA hunspellDicts.th_TH
    tmux curl git ripgrep
    zip unzip
    rsync strace gnupg pinentry lynis
    vlc clinfo glxinfo pciutils vulkan-tools wayland-utils flatpak
    gnome.gnome-software corectrl libva-utils nvtop-amd
  ];


}
