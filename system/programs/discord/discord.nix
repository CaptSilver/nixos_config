{ pkgs, ... }:

{

  imports = [

  ];

  environment.systemPackages = with pkgs; [

    (discord.override { withOpenASAR = true; withVencord = true; })

  ];


}
