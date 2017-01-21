#
{ config, lib, pkgs, nixpkgs, ... }:

let custom = import ../../pkgs/default.nix {}; in
{
   environment.systemPackages = with pkgs; [
        custom.nagnu
        custom.nagstamon
        ];


}
