{ config }: {

  enable = true;
  configHome = "${config.vars.homed}/.config";
  cacheHome = "${config.vars.homed}/.cache";
  dataHome = "${config.vars.locald}/share";
  stateHome = "${config.vars.locald}/state";

}