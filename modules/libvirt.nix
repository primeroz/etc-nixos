#
{ config, lib, pkgs, nixpkgs, ... }:

{
   virtualisation.libvirtd.enable = true;

   #environment.systemPackages = with pkgs; [
   #     docker
   #     ];


}
