 
{ pkgs, ... }:

{

  imports = [

  ];

    fonts = {
      fontDir.enable = true;
      fontconfig.enable = true;
      enableGhostscriptFonts = true;

      fonts = with pkgs;[
        corefonts
        inconsolata
        terminus_font
        dejavu_fonts
        ubuntu_font_family
        source-code-pro
        source-sans-pro
        source-serif-pro
        roboto-mono
        roboto
        overpass
        libre-baskerville
        font-awesome
        julia-mono
      ];
     };
}
