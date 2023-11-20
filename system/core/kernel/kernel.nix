{ lib, pkgs, config, ... }:

{

  imports = [

  ];

  hardware.bluetooth.enable = true;

  #boot.kernelPackages =
  #  with builtins; with lib; let
  #    latestCompatibleVersion = config.boot.zfs.package.latestCompatibleLinuxPackages.kernel.version;
  #    hardenedPackages = filterAttrs (name: packages: hasSuffix "_hardened" name && (tryEval packages).success) pkgs.linuxKernel.packages;
  #    compatiblePackages = filter (packages: compareVersions packages.kernel.version latestCompatibleVersion <= 0) (attrValues hardenedPackages);
  #    orderedCompatiblePackages = sort (x: y: compareVersions x.kernel.version y.kernel.version > 0) compatiblePackages;
  #  in head orderedCompatiblePackages;

  boot.kernelPackages = pkgs.linuxPackages_xanmod_stable;
  boot.extraModulePackages = with config.boot.kernelPackages; [ zfs ];

#Chrome, Steam, and builds require user namespaces
  boot.kernel.sysctl = {
    "kernel.unprivileged_userns_clone" = 1;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };

  swapDevices = [
    {
      device = "/dev/zram0";
    }
  ];

}
