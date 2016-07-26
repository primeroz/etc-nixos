#
{ config, lib, pkgs, nixpkgs, ... }:

let custompkgs = import ../nixpkgs/default.nix {}; in
{
   virtualisation.docker.enable = true;
   #virtualisation.docker.storageDriver = "zfs";
   virtualisation.docker.extraOptions = "--log-driver journald";

   environment.systemPackages = with pkgs; [
        docker
        custompkgs.python27Packages.dockerpty
        custompkgs.python27Packages.docker_compose
        ];


}
