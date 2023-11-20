{ ... }:

{

  imports = [
  ];

  boot = {
    consoleLogLevel = 0;
    supportedFilesystems = [ "ext4" "zfs" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub.copyKernels = true;
    };
    tmp = {
      useTmpfs = true;
      cleanOnBoot = true;
    };
    zfs = {
      forceImportRoot = true;
      extraPools = [ "nvme" "storage" "backup" "coldstorage" ];
    };
    initrd.systemd.enable = true; #Can't run post commands with systemd in initrd
    plymouth.enable = true;
    plymouth.theme = "breeze";
#    initrd.network = {
#      postCommands = ''
#      zfs load-key -a
#      '';
#    };
  };

  networking.hostId = "ef26e8fd";

#  fileSystems."/home/dave/Videos" = {
#    device = "coldstorage/videos";
#    fsType = "zfs";
#  };

}
