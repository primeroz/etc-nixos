{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
	feh
	leafpad
	networkmanagerapplet
	tilda
	volumeicon
 	wireshark-gtk
	];

}
