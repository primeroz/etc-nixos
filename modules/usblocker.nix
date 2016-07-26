#
{ config, lib, pkgs, nixpkgs, ... }:

{

  services.udev.extraRules = ''
   #ACTION=="remove", ENV{ID_SERIAL_SHORT}=="4C530101871015101350", RUN+="/var/setuid-wrappers/physlock -s -u prz"
   #ACTION=="remove", ENV{ID_SERIAL_SHORT}=="4C530101871015101350", RUN+="/run/current-system/sw/bin/env DISPLAY=:0.0 /run/current-system/sw/bin/i3lock"
   ACTION=="remove", ENV{ID_SERIAL_SHORT}=="4C530101871015101350", RUN+="/run/current-system/sw/bin/date >> /tmp/testfile"
       '';
}
