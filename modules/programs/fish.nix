{ config }: {

  enable = true;

  shellInit = ''
    abbr -a !! -p anywhere --function last_history_item
    abbr -a -p anywhere -- --help "--help 2>&1 | ${config.vars.env} bat --language=help --style=plain"
  '';

  functions = {
    fish_greeting = "";
    last_history_item = "echo $history[1]";
    mkcd = ''
      test -z $argv
      and return 1
      or mkdir $argv && cd $argv
    '';

    fontq = ''
      if test -z $argv
        return 1
      else
        ${config.vars.env} fc-list : family | grep -i $argv
      end
    '';

    whichlink = ''
      if test -z $argv
        return 1
      else
        ${config.vars.env} which $argv[1] | xargs -r readlink
      end
    '';

    mktar = ''
      test -f $argv
      and return 1
      or ${config.vars.env} tar --create --verbose -f "$argv.tar" $argv
    '';

    untar = ''
      test -f $argv
      and return 1
      or ${config.vars.env} tar --extract --verbose -f $argv
    '';

    unsetcc = ''
      set varlist CC CXX CPP CFLAGS CXXFLAGS CPPFLAGS LD LDFLAGS AR AS LD_LIBRARY_PATH
      for n in $varlist
        set -e $n
      end
    '';


  };

  shellAbbrs = {
    pf = "pfetch";
    nf = "neofetch";
    ff = "fastfetch";
    nv = "nvim";
    m = "micro";
    info = "pinfo";
  };


  interactiveShellInit = "${config.vars.env} zoxide init fish | source";

}