{ config, pkgs, lib, ... }: with lib;
{
  #imports = [ ./xcompose.nix ];
  imports = [ ./extra.nix ./games.nix ];

  config = mkIf config.services.xserver.enable {
    services.xserver = {
      displayManager.slim = {
        enable = true;
        defaultUser = "prz";
        theme = ./slim-theme;
      };

      windowManager.i3.enable = true;
      desktopManager.xterm.enable = false;


      displayManager.sessionCommands = ''
          ${pkgs.feh}/bin/feh --bg-scale ./wallpapers/wallpaper.jpg &
        '' + optionalString config.networking.networkmanager.enable ''
          ${pkgs.networkmanagerapplet}/bin/nm-applet &
        '';

      xkbOptions = "compose:caps";
      synaptics = {
        enable = true;
        tapButtons = false;
        twoFingerScroll = true;
      };
    };

    hardware = {
      pulseaudio.enable = true;
      opengl.driSupport32Bit = true;
      pulseaudio.support32Bit = true;
    };

    environment.systemPackages = with pkgs;
      [ alsaUtils xsel pavucontrol xorg.xkill ] ++
      [ i3 i3lock i3status chromium vimb st dmenu ] ++
      [ libnotify ghostscript graphviz ] ++
      #[ steam xonotic ];
      [ ];

    nixpkgs.config.chromium.enablePepperFlash = false;

    fonts = {
      enableFontDir = true;
      enableGhostscriptFonts = true;
      fonts = with pkgs; [ source-code-pro carlito noto-fonts-emoji mplus-outline-fonts ];
      fontconfig = {
        antialias = true;
        enable = true;
        hinting.autohint = false;
        hinting.enable = true;
        hinting.style = "slight";
        includeUserConf = false;
        subpixel.lcdfilter = "default";
        subpixel.rgba = "rgb";
        ultimate.enable = true;
        ultimate.substitutions = "combi";
      };
    };
  };
}
