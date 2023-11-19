{ ... }:

{

  imports = [
  ];

  boot = {
    supportedFilesystems = [ "ext4" "zfs" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    tmp = {
      useTmpfs = true;
      cleanOnBoot = true;
    };
    zfs = {
      forceImportRoot = true;
      extraPools = [ "nvme" "storage" "backup" "coldstorage" ];
    };
    initrd.network = {
      postCommands = ''
      zfs load-key -a
      '';
    };
  };

  networking.hostId = "ef26e8fd";

  fileSystems."/home/dave/Videos" = {
    device = "coldstorage/videos";
    fsType = "zfs";
  };

}
