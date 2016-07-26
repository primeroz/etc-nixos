#
{ config, lib, pkgs, nixpkgs, ... }:

let upstream = import ../nixpkgs/default.nix {}; in
{
   virtualisation.docker.enable = true;
   #virtualisation.docker.storageDriver = "zfs";
   virtualisation.docker.extraOptions = "--log-driver journald";

   environment.systemPackages = with pkgs; [
        docker
        upstream.python27Packages.dockerpty
        upstream.python27Packages.docker_compose
        ];


}
