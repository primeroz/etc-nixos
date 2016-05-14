#
{ config, lib, pkgs, ... }:

{
   virtualisation.docker.enable = true;
   virtualisation.docker.storageDriver = "zfs";

   environment.systemPackages = with pkgs; [
        docker
        pkgs.python27Packages.docker_compose
        ];


}
