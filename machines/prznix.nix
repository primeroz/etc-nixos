# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib,... }:

{
  imports =
    [
      <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
      ../profiles/home-laptop.nix
    ];

  # BOOT Options

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.luks.cryptoModules = ["aes" "sha256" "sha1" "cbc"];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = [ "zfs" ];

  #boot.kernelParams = assert config.boot.kernelPackages.kernel.features.bfq or false;
          #[ "elevator=bfq" ];


  networking.hostName = "prznix"; # Define your hostname.
  networking.networkmanager.enable = true;  # Enables NetworkManager
  networking.hostId = "619f329b";

  # Machine Hardware Config -
  # Encrypted Disk
  boot.initrd.luks.devices = [
    { name = "luksroot"; device = "/dev/sda2"; preLVM = true; }
  ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/9cab5f36-316e-46be-879c-6cd9dcad6f21";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/18108d88-fd70-430c-a5c2-a7cf172932c0";
      fsType = "ext4";
    };

  fileSystems."/home/prz/.local/share/Steam" =
    { device = "/dev/disk/by-uuid/dfb6048a-8a3f-41c7-9090-b392904ecc5f";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/55e10e0d-cd51-49c0-8c5b-9a1551159fcf"; }
    ];

  nix.maxJobs = lib.mkDefault 4;

  # Select internationalisation properties.
  i18n = {
  #   consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "uk";
     defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/London";


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.03";
}
