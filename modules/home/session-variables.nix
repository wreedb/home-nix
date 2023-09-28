{ config }: {

    EDITOR = "${config.vars.emacscmd}";
    VISUAL = "${config.vars.emacscmd}";
    LAUNCHER = "wofi --show run";
    DOCUMENT_READER = "mupdf";
    IMAGE_VIEWER = "nsxiv";
    VIDEO_PLAYER = "mpv";
    TERMINAL = "wezterm";
    BROWSER = "firefox";
    MANWIDTH = 80;
    MANPAGER = "most";
    PAGER = "most";
    OPENER = "xdg-open";
    SCRIPTS_DIR = "${config.vars.scriptsd}";

}