#
{ config, lib, pkgs, nixpkgs, ... }:

{

  config = lib.mkIf config.services.xserver.enable {

    services.udev.extraRules = ''
     ATTRS{idVendor}=="2581", ATTRS{idProduct}=="3b7c", MODE="660", OWNER="prz",SYMLINK+="ledger"
       '';
  };

}
