{ config }: {

  enable = true;
  config = {
    loop-file = "inf";
    loop-playlist = "inf";
    osd-font = "${config.vars.font_ui}";
    osd-font-size = 48;
  };

}