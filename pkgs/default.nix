{ pkgs ? import <nixpkgs> {} }: with pkgs;

rec {

  hugo = callPackage ./hugo {};
  shell2http = callPackage ./shell2http {};
  terminus = callPackage ./terminus {};
  #linux = callPackage ./linux {};
  #linuxPackages = pkgs.linuxPackagesFor linux linuxPackages;

}

