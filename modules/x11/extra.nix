{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
	arandr
	brackets
	feh
	leafpad
	networkmanagerapplet
	pkgs.qt55.qtbase
	tilda
	volumeicon
 	wireshark-gtk
	];

}
