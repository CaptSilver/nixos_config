{ pkgs, options, ... }:

{

  imports = [
  ];

  nix = {
    package = pkgs.nixFlakes;
    nixPath = options.nix.nixPath.default ++ [ "nixpkgs-overlays=../../overlays-compat/" ];
    extraOptions = ''
      experimental-features = nix-command flakes
      '';
#    settings = {
#      substituters = ["https://nix-gaming.cachix.org"];
#      trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
#      };
    };

  system.autoUpgrade = {
    enable = true;
#    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "00:00";
    randomizedDelaySec = "45min";
  };

# Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}

