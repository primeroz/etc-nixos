#
{ config, lib, pkgs, ... }:

let custom = import ../pkgs {}; in
{

  environment.systemPackages = with pkgs; [
    #custom.shell2http
    #custom.terminus
    #custom.hugo
    ruby
	];

}
