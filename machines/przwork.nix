# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
	<nixpkgs/nixos/modules/installer/scan/not-detected.nix>
      	../profiles/work-laptop.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  ### CHANGE THIS ####
  boot.loader.grub.device = "/dev/sdc";

  networking.hostName = "przwork"; # Define your hostname.
  networking.networkmanager.enable = true;  

  # Select internationalisation properties.
  i18n = {
    #consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "uk";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;


  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.03";

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.luks.cryptoModules = [ "aes" "sha256" "xts" "sha1" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  #boot.supportedFilesystems = [ "zfs" ];

  boot.initrd.luks.mitigateDMAAttacks = true;
  boot.initrd.luks.devices = [
	{ name="luksRoot"; device="/dev/sdc2"; preLVM=true; allowDiscards=true; }
  ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/6f2ac5f3-b462-4e0e-a9c7-34146a2a50f5";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/6cdd3809-86c0-428b-a562-48e15bdc0e6e";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/c81db471-bc35-47b3-9da5-09a1d16268b5";
      fsType = "ext4";
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/71a85fd3-91cd-4471-be23-8fb6424e499c";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/167f87b5-b6fd-416c-9e2d-533e29d6613f"; }
    ];

  nix.maxJobs = lib.mkDefault 4;
}
