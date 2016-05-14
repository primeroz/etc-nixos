{ config, lib, pkgs, ... }:

{
   users.extraUsers.prz = {
     createHome = true;
     description = "PrZ";
     isNormalUser = true;
     home = "/home/prz";
     shell = "/run/current-system/sw/bin/zsh";
     group = "users";
     extraGroups = ["wheel" "networkmanager" "docker" ];
     email = "primeroznl@gmail.com";
     uid = 1000;
   };

  #environment.etc.gitconfig.text = let cfg = config.users.extraUsers.prz; in ''
  # ${builtins.readFile ./gitconfig}
  # [user]
  #   name = ${cfg.description}
  #   email = ${cfg.email}
  #';
}
