#
{ config, lib, pkgs, ... }:

{
   virtualisation.docker.enable = true;
   #virtualisation.docker.storageDriver = "zfs";
   virtualisation.docker.extraOptions = "--log-driver journald";

   #packageOverrides = pkgs: rec {
   #  docker_compose = pkgs.python27Packages.docker_compose.override (
   #    attrs: {
   #      version = "1.6.2";
   #      src = pkgs.fetchurl {
   #        url = "mirror://pypi/d/docker-compose/${name}.tar.gz";
   #        sha256 = "10i4032d99hm5nj1p74pcad9i3gz1h5x3096byklncgssfyjqki6";
   #      };
   #    };
   #  );
   #};

   environment.systemPackages = with pkgs; [
        docker
        pkgs.python27Packages.docker_compose
        ];


}
