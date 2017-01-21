#
{ config, lib, pkgs, nixpkgs, ... }:

{
   environment.systemPackages = with pkgs; [
    	(texlive.combine {
      		inherit (texlive) scheme-medium type1cm wallpaper tcolorbox environ pst-barcode auto-pst-pdf coolstr pstricks marginnote ifplatform pst-pdf preview
      		trimspaces;
      		# more packages to be found at
      		# https://github.com/NixOS/nixpkgs/blob/master/pkgs/tools/typesetting/tex/texlive-new/pkgs.nix if needed
    	})
        ];


}
