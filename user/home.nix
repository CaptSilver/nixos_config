{ config, pkgs, ... }:

{

  imports = [ ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "dave";
  home.homeDirectory = "/home/dave";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  home = {
    packages = [
      pkgs.htop
    ];
  };
  programs.htop = {
    enable = true;
    settings = {
      fields = with config.lib.htop.fields; [
        PID
        USER
        PRIORITY
        NICE
        M_SHARE
        STATE
        M_SWAP
        PERCENT_MEM
        M_RESIDENT
        PERCENT_CPU
        TIME
        COMM
      ];
      highlight_base_name = 1;
    } // (with config.lib.htop; leftMeters [
      (bar "AllCPUs4")
      (bar "CPU")
      (bar "Memory")
      (bar "Swap")
      (bar "HugePages")
    ]) // (with config.lib.htop; rightMeters [
      (text "Tasks")
      (text "LoadAverage")
      (text "Uptime")
      (text "Battery")
      (text "DiskIO")
      (text "NetworkIO")
      (text "MemorySwap")
    ]);
  };

}
