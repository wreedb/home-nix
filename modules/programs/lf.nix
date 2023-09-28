{ config, pkgs }: {

  enable = true;

  previewer.source = pkgs.writeShellScript "pv.sh" ''
    #!/usr/bin/env sh
    case "$1" in
        *.tar*) ${config.vars.env} tar -tf "$1" ;;
        *.zip) ${config.vars.env} unzip -l "$1" ;;
        *.rar) ${config.vars.env} unrar l "$1" ;;
        *.7z) ${config.vars.env} 7z l "$1" ;;
        *.pdf) ${config.vars.env} pdftotext "$1" - ;;
        *) ${config.vars.env} bat --color=always "$1" ;;
    esac
  '';

  settings = { hidden = true; };

}