#
{ config, lib, pkgs, nixpkgs, ... }:

{

  config = lib.mkIf config.services.xserver.enable {

    environment.systemPackages = with pkgs; [
        gnupg
        openssl
        ykpers
        yubikey-personalization
        yubikey-personalization-gui
        ];

    services.udev.extraRules = ''
     ATTRS{idVendor}=="1050", ATTRS{idProduct}=="0403", MODE="660", OWNER="prz",SYMLINK+="yubikey"
       '';
  };

}
