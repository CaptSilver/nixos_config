# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, config, inputs, lib, options, ... }:

#  let
#    nix-gaming = import (
#      builtins.fetchTarball "https://github.com/fufexan/nix-gaming/archive/master.tar.gz");
#      unstable = import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz");
#  in {
{
#  nixpkgs.config.allowUnfree = true;

#    nix.nixPath = options.nix.nixPath.default ++ [ "nixpkgs-overlays=/etc/nixos/overlays-compat/" ];
#    nix = {
#      package = pkgs.nixFlakes;
#      nixPath = options.nix.nixPath.default ++ [ "nixpkgs-overlays=/etc/nixos/overlays-compat/" ];
#      extraOptions = ''
#        experimental-features = nix-command flakes
#        '';
#      settings = {
#        substituters = ["https://nix-gaming.cachix.org"];
#        trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
#      };
#    };
#    environment.systemPackages = with pkgs; [
#      nix-gaming.packages.${pkgs.hostPlatform.system}.wine-ge
#      discord yakuake wireguard-tools
#      firefox kate htop
#      libreoffice-qt
#      hunspell hunspellDicts.uk_UA hunspellDicts.th_TH
#      tmux curl git ripgrep
#      zip unzip
#      rsync strace gnupg pinentry lynis
#      vlc clinfo glxinfo pciutils vulkan-tools wayland-utils flatpak
#      gnome.gnome-software corectrl libva-utils nvtop-amd
#   ];

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./system
      ./machines
#      nix-gaming.nixosModules.pipewireLowLatency
#      nix-gaming.nixosModules.steamCompat
    ];

#  system.autoUpgrade = {
#    enable = true;
#    flake = inputs.self.outPath;
#    flags = [
#      "--update-input"
#      "nixpkgs"
#      "-L" # print build logs
#    ];
#    dates = "00:00";
#    randomizedDelaySec = "45min";
#  };

# Automatic Garbage Collection
#  nix.gc = {
#    automatic = true;
#    dates = "weekly";
#    options = "--delete-older-than 7d";
#  };

  
  # Bootloader.
#  boot.loader.systemd-boot.enable = true;
#  boot.loader.efi.canTouchEfiVariables = true;

#  hardware.bluetooth.enable = true;
#  hardware.opengl.extraPackages = with pkgs; [
#    rocm-opencl-icd
#    rocmPackages.rocm-runtime
#    amdvlk
#  ];

#  boot.kernelPackages = 
#    with builtins; with lib; let 
#      latestCompatibleVersion = config.boot.zfs.package.latestCompatibleLinuxPackages.kernel.version;
#     zenPackages = filterAttrs (name: packages: packages.kernel.version ) pkgs.linuxPackages_zen;
#      compatiblePackages = filter  (packages: compareVersions packages.kernel.version latestCompatibleVersion <= 0) (attrValues zenPackages);
#      orderedCompatiblePackages = sort  (x: y: compareVersions x.kernel.version y.kernel.version > 0) compatiblePackages;
#    in head orderedCompatiblePackages;   

#  boot.kernelPackages =
#    with builtins; with lib; let
#      latestCompatibleVersion = config.boot.zfs.package.latestCompatibleLinuxPackages.kernel.version;
#      hardenedPackages = filterAttrs (name: packages: hasSuffix "_hardened" name && (tryEval packages).success)  pkgs.linuxKernel.packages;
#      compatiblePackages = filter (packages: compareVersions packages.kernel.version latestCompatibleVersion <= 0) (attrValues hardenedPackages);
#      orderedCompatiblePackages = sort (x: y: compareVersions x.kernel.version y.kernel.version > 0) compatiblePackages;
#    in head orderedCompatiblePackages;

#Chrome, Steam, and builds require user namespaces
#  boot.kernel.sysctl = {
#    "kernel.unprivileged_userns_clone" = 1;
#  };

#  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
#  programs.cfs-zen-tweaks.enable = true;

#  boot.kernelPackages = pkgs.linuxPackages_zen.extend (final: prev: {
#    zfs = prev.zfs.overrideAttrs (self: {
#      meta = self.meta // {broken = false;};
#    });
#  });

#  boot = {
#    tmp = {
#      useTmpfs = true;
#      cleanOnBoot = true;
#    };
#    initrd.network = {
#      postCommands = ''
#      # Import all pools
#      zpool import -a
#      zfs load-key -a
#      '';
#    };
#  };
#  boot.supportedFilesystems = [ "zfs" ];
#  boot.zfs.forceImportRoot = false;
#  boot.zfs.extraPools = [ "nvme" "storage" "backup" ];
#  networking.hostId = "ef26e8fd";
#  fileSystems."/home/dave/Videos" = {
#    device = "coldstorage/videos";
#    fsType = "zfs";
#  };

#  services.sanoid = {
#    enable = true;
#    datasets."nvme/home".useTemplate = [ "production" ];
#    datasets."storage/home".useTemplate = [ "storage" ];
#    datasets."coldstorage/videos".useTemplate = [ "production" ];
#    templates.storage = {
#      autosnap = false;
#      autoprune = true;
#      daily = 180;
#      hourly = 240;
#    };
#    templates.production = {
#      autosnap = true;
#      autoprune = true;
#      daily = 7;
#      hourly = 24;
#    };
#  };
#
#  services.syncoid.commands."nvme/home" = {
#       target = "storage/home";
#       interval = "*-*-* 00:00:00";
#   };
  
#  zramSwap = {
#    enable = true;
#    memoryPercent = 80;
#  };
#
#  swapDevices = [
#    {
#      device = "/dev/zram0";
#    }
#  ];


#  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
#  networking.networkmanager.enable = true;

  # Set your time zone.
#  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
#  i18n.defaultLocale = "en_US.UTF-8";

#  i18n.extraLocaleSettings = {
#    LC_ADDRESS = "en_US.UTF-8";
#    LC_IDENTIFICATION = "en_US.UTF-8";
#    LC_MEASUREMENT = "en_US.UTF-8";
#    LC_MONETARY = "en_US.UTF-8";
#    LC_NAME = "en_US.UTF-8";
#    LC_NUMERIC = "en_US.UTF-8";
#    LC_PAPER = "en_US.UTF-8";
#    LC_TELEPHONE = "en_US.UTF-8";
#    LC_TIME = "en_US.UTF-8";
#  };

  #Flatpak
#  services.flatpak.enable = true;
  
  # Enable the X11 windowing system.
#  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
#  services.xserver.displayManager.defaultSession = "plasmawayland";
#  services.xserver.displayManager.sddm.enable = true;
#  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
#  services.xserver = {
#    layout = "us";
#    xkbVariant = "";
#  };

  # Enable CUPS to print documents.
#  services.printing.enable = true;

  # Enable sound with pipewire.
#  sound.enable = true;
#  hardware.pulseaudio.enable = false;
#  hardware.pulseaudio.support32Bit = true;
#  security.rtkit.enable = true;
#  services.pipewire = {
#    enable = true;
#    alsa.enable = true;
#    alsa.support32Bit = true;
#    pulse.enable = true;

#    lowLatency = {
      # enable this module
#      enable = true;
      # defaults (no need to be set unless modified)
#      quantum = 64;
#      rate = 48000;
#    };
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
#  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dave = {
    isNormalUser = true;
    description = "David Goree";
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };

  # Enable automatic login for the user.
#  services.xserver.displayManager.autoLogin.enable = true;
#  services.xserver.displayManager.autoLogin.user = "dave";

#  programs.gamemode.enable = true;

#  services.plex = {
#    enable = true;
#    openFirewall = true;
#  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
#  services.openssh = {
#    enable = true;
#    openFirewall = false;
#  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

#  programs.steam = {
#    enable = true;
#    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
#    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
#  };
#  hardware.opengl.driSupport32Bit = true; # Enables support for 32bit libs that steam uses
#  hardware.steam-hardware.enable = true;

#  fonts = {
#    fontDir.enable = true;
#    fonts = with pkgs;[
#      corefonts
#      inconsolata
#      terminus_font
#      dejavu_fonts
#      ubuntu_font_family
#      source-code-pro
#      source-sans-pro
#      source-serif-pro
#      roboto-mono
#      roboto
#      overpass
#      libre-baskerville
#      font-awesome
#      julia-mono
#    ];
#  };

}

