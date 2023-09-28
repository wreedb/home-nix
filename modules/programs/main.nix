{ config, pkgs }: {

  mpv = import ./mpv.nix { inherit config; };
  lf = import ./lf.nix { inherit config pkgs; };
  fish = import ./fish.nix { inherit config; };

  command-not-found.enable = true;
  home-manager.enable = true;
  yt-dlp.enable = true;
  tealdeer.enable = true;
  jq.enable = true;
  fuzzel.enable = true;
  bottom.enable = true;
  fzf.enable = true;
  skim.enable = true;
  gallery-dl.enable = true;
  btop.enable = true;
  gh.enable = true;
  gh.settings.editor = "${config.home.sessionVariables.EDITOR}";
  hyfetch.enable = true;

  gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };

  git = {
    enable = true;
    userEmail = "wreedb@skiff.com";
    userName = "Will Bryan Reed";
    extraConfig.init.defaultBranch = "main";

  };

  chromium = {
    enable = true;
    commandLineArgs = [
      "--ozone-platform=wayland"
      "--enable-features=VaapiVideoDecoder"
    ];
  };

  keychain = {
    enable = true;
    inheritType = "any-once";
    agents = [ "ssh" ];
    extraFlags = [
      "--quiet"
      "--dir ${config.xdg.dataHome}/keychain"
      "--eval ${config.vars.homed}/.ssh/key"
    ];

  };

}