#
{ config, lib, pkgs, nixpkgs, ... }:

{
   virtualisation.libvirtd.enable = true;
   virtualisation.libvirtd.enableKVM = true;
   virtualisation.libvirtd.onShutdown = "shutdown";

   #environment.systemPackages = with pkgs; [
   #     docker
   #     ];


}
