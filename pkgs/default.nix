{ pkgs ? import <nixpkgs> {} }: with pkgs;

rec {

  hugo = callPackage ./hugo {};
  shell2http = callPackage ./shell2http {};
  terminus = callPackage ./terminus {};
  nagstamon = callPackage ./nagstamon {};
  nagnu = callPackage ./nagnu {};
  #linux = callPackage ./linux {};
  #linuxPackages = pkgs.linuxPackagesFor linux linuxPackages;

}

