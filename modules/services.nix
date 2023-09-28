{ config, pkgs }: {

  status-notifier-watcher.enable = true;

  wlsunset = {
    enable = true;
    latitude = "44.811348";
    longitude = "-91.498497";
    temperature.day = 7500;
    temperature.night = 5500;
  };

  swayidle = {
    enable = true;
    timeouts = [
      { timeout = 500; command = "${pkgs.swaylock-effects}/bin/swaylock"; }
    ];
  };

  dunst = {

    enable = true;

    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela";
    };

    settings = {

      global = {
        width = 300;
        height = 300;
        offset = "30x50";
        origin = "top-right";
        transparency = 10;
        frame_color = "#eceff1";
        font = "${config.vars.font_ui} 11";
      };

      urgency_normal = {
        background = "#37474f";
        foreground = "#eceff1";
        timeout = 10;
      };

    };

  };

}