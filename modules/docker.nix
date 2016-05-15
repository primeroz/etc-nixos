#
{ config, lib, pkgs, ... }:

{
   virtualisation.docker.enable = true;
   #virtualisation.docker.storageDriver = "zfs";
   virtualisation.docker.extraOptions = "--log-driver journald";

   environment.systemPackages = with pkgs; [
        docker
        pkgs.python27Packages.docker_compose
        ];


}
