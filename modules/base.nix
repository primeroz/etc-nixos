#
{ config, lib, pkgs, ... }:

let upstream = import ../nixpkgs/default.nix {}; in
{
  environment.etc.hostname.text = config.networking.hostName;

  # https://code.nathan7.eu/nathan7/etc-nixos/src/master/modules/base.nix
  # nixpkgs.config.packageOverrides = import ../pkgs;
  # environment.etc."nix/nixpkgs-config.nix".text = "(import <nixpkgs/nixos> {}).config.nixpkgs.config";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
	acpi
	ack
	aspell
	aspellDicts.en
	boot
	cryptsetup
	ctags
	dstat
	file
    	git
	gnumake
	gnupg
	htop
	jdk
	jq
	lsof
	mtr
	ncdu
	nix-repl
	nix-prefetch-git
    	nox
	nmap
	pciutils
	pstree
	pv
	python27
	upstream.python27Packages.configparser
	silver-searcher
	sysstat
	taskwarrior
	tcpdump
	traceroute
	tree
	tmux
	unzip
	usbutils
	vim
	wget
	which
	xmlstarlet
	zsh
	];

  environment.variables.EDITOR = "vim";

  environment.variables.JAVA_HOME = "${pkgs.jdk}/lib/openjdk";

  programs = {
    zsh.enable = true;
    bash.enableCompletion = true;
    ssh = {
      startAgent = true;
      extraConfig = ''
        Host *
          ControlMaster auto
          ControlPersist yes
          ControlPath /run/user/%i/ssh-socket-%r@%h:%p
          ServerAliveInterval 60
      '';
    };
  };

  systemd.user.services.gpg-agent = {
    description = "GPG Agent";
    wantedBy = [ "default.target" ];
    serviceConfig = {
      Type = "forking";
      ExecStart = "${pkgs.gnupg}/bin/gpg-agent --daemon --pinentry-program ${pkgs.pinentry}/bin/pinentry-gtk-2 --use-standard-socket";
    };
  };

  services.physlock = {
    enable = true;
    user = "prz";
  };
  security.setuidPrograms = [ "physlock" ];

  security.sudo.extraConfig = ''
    %wheel ALL = NOPASSWD: /run/current-system/sw/bin/zfs list
    %wheel ALL = NOPASSWD: /run/current-system/sw/bin/zfs list *
    %wheel ALL = NOPASSWD: /run/current-system/sw/bin/zfs get
    %wheel ALL = NOPASSWD: /run/current-system/sw/bin/zfs get *
    %wheel ALL = NOPASSWD: /run/current-system/sw/bin/zpool status
    %wheel ALL = NOPASSWD: /run/current-system/sw/bin/zpool status *
    %wheel ALL = NOPASSWD: /run/current-system/sw/bin/zpool list
    %wheel ALL = NOPASSWD: /run/current-system/sw/bin/zpool list *
    %wheel ALL = NOPASSWD: /run/current-system/sw/bin/zpool get
    %wheel ALL = NOPASSWD: /run/current-system/sw/bin/zpool get *
    %wheel ALL = NOPASSWD: ALL
  '';

  # singleton not available ?
  # hack for things that don't know about XDG_RUNTIME_DIR
  #systemd.automounts = singleton { where = "/run/user/0"; wantedBy = [ "local-fs.target" ]; };
  #systemd.mounts = singleton { what = "/run"; where = "/run/user/0"; type = "none"; options = "bind"; };

}
