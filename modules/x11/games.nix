{ config, pkgs, lib, ... }: with lib;
{

    environment.systemPackages = with pkgs;
      [ steam ] ++
      [ ];

}
