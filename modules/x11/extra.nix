{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
	arandr
	feh
	leafpad
	networkmanagerapplet
	pkgs.qt55.qtbase
	tilda
	volumeicon
 	wireshark-gtk
	];

}
