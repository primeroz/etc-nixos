#
{ config, lib, pkgs, nixpkgs, ... }:

{
   virtualisation.docker.enable = true;
   #virtualisation.docker.storageDriver = "zfs";
   virtualisation.docker.extraOptions = "--log-driver journald";

   #nixpkgs.config.packageOverrides = pkgs: rec {
   #  docker_compose = pkgs.python27Packages.docker_compose.override (
   #    attrs: {
   #      version = "1.7.1";
   #      src = pkgs.fetchurl {
   #        url = "https://pypi.python.org/packages/b6/20/0a65e13ac06c4693f28ded22b87882ca1750239bdc0a05d4a4df4e3a9faa/docker-compose-1.7.1.tar.gz";
   #        sha256 = "97460873bfa9228afee543881ff6f6f7e4c12ac81974a2fcfa40fce272b2934e";
   #      };
   #    }
   #  );
   #};

   environment.systemPackages = with pkgs; [
        docker
        pkgs.python27Packages.docker_compose
#        pkgs.python27Packages.six
#        (pkgs.lib.overrideDerivation pkgs.python27Packages.dockerpty (attrs: {
#                    name = "dockerpty-0.4.1";
#                    src = pkgs.fetchurl {
#                        url = "https://pypi.python.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba/dockerpty-0.4.1.tar.gz";
#                        sha256 = "1kjn64wx23jmr8dcc6g7bwlmrhfmxr77gh6iphqsl39sayfxdab9";
#                    };
#                      buildInputs = [
#                        python27
#                      ];
#            }))
#        (pkgs.lib.overrideDerivation pkgs.python27Packages.docker_compose (attrs: {
#                      version = "1.6.2";
#                      name = "docker-compose-1.6.2";
#                      src = pkgs.fetchurl {
#                        url = "https://github.com/docker/compose/archive/1.6.2.tar.gz";
#                        sha256 = "1c318cdf12bdc97e079224fb0cab45ed0f6ec2d1ce87599eff549b1aafa27837";
#                      };
#                      buildInputs = [
#                        python27
#                        python27Packages.dockerpty
#                      ];
#
#            }))

        ];


}
