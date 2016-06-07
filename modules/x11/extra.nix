{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
	feh
	networkmanagerapplet
	tilda
	volumeicon
 	wireshark-gtk
	];

}
