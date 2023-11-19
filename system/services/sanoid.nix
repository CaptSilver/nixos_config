{ ... }:

{

  imports = [
  ];

  services.sanoid = {
    enable = true;
    datasets."nvme/home".useTemplate = [ "production" ];
    datasets."storage/home".useTemplate = [ "storage" ];
    datasets."coldstorage/videos".useTemplate = [ "production" ];
    templates.storage = {
      autosnap = false;
      autoprune = true;
      daily = 180;
      hourly = 240;
    };
    templates.production = {
      autosnap = true;
      autoprune = true;
      daily = 7;
      hourly = 24;
    };
  };

  services.syncoid.commands."nvme/home" = {
       target = "storage/home";
       interval = "*-*-* 00:00:00";
   };

}

