{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
	feh
	networkmanagerapplet
	volumeicon
 	wireshark-gtk
	];

}
