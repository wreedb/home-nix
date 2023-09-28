{ config, pkgs, ... }: {

  imports = [ ./variables.nix ];

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      system-features = [ "gccarch-tigerlake" "kvm" ];
      use-xdg-base-directories = true;
    };
  };

  nixpkgs.config = { allowBroken = true; allowUnfree = true; };

  vars = {
    env = "/usr/bin/env";
    emacscmd = "/usr/bin/env emacsclient --create-frame --alternate-editor emacs";
    homed = "${config.home.homeDirectory}";
    locald = "${config.vars.homed}/.local";
    scriptsd = "${config.vars.locald}/scripts";
    emacsbin = "${config.xdg.configHome}/emacs/bin";
    nixprofile = "${config.xdg.stateHome}/nix/profile";
    font_ui = "Roboto Condensed";
    font_mono = "JetBrains Mono";
  };

  systemd = import ./modules/systemd.nix;
  xdg = import ./modules/xdg.nix { inherit config; };
  home = import ./modules/home/main.nix { inherit config pkgs; };
  services = import ./modules/services.nix { inherit config pkgs; };
  programs = import ./modules/programs/main.nix { inherit config pkgs; };

  manual.manpages.enable = true;
  news.display = "silent";

}