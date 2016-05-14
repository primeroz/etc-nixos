{ config, lib, ... }: with lib;
{
  config.environment = mkIf config.services.xserver.enable {
    etc.XCompose.source = ./xcompose;
    variables.GTK_IM_MODULE = "xim";
    variables.XCOMPOSEFILE = "/etc/XCompose";
  };
}
