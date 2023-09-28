{ config, pkgs }: {

  username = "wbr";
  homeDirectory = "/home/${config.home.username}";
  # profileDirectory = "${config.vars.nixprofile}";

  stateVersion = "23.11";


  packages = with pkgs; [
    # fetch scripts
    fastfetch pfetch neofetch
    # other main apps
    wezterm
    vscode
    # util apps
    swaylock-effects
    dconf
    pastel
    vivid
    readline
    rlwrap
    wl-clipboard
    xclip
  ];

  sessionPath = [ "${config.vars.emacsbin}" ];

  sessionVariables = import ./session-variables.nix { inherit config; };

  pointerCursor = {
    gtk.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
    size = 36;
  };

  shellAliases = import ./shell-aliases.nix;

}