{ pkgs, ... }:

{

  imports = [

  ];

#  Plasma already provides this
#  programs.firefox.nativeMessagingHosts.packages = [ pkgs.plasma5Packages.plasma-browser-integration ];

  programs.firefox = {
    enable = true;
    preferences = {
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
  };

  environment.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
  };
}
