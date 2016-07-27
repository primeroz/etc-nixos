#
{ stdenv, fetchFromGitHub, ncurses, curl }:

stdenv.mkDerivation rec {
  version = "master";
  name = "nagnu-${version}";

  src = fetchFromGitHub {
    owner = "frlen";
    repo = "nagnu";
    rev = "master";
    sha256 = "1i2jm8ibvqcc734daamnzc3hx8q0nsry1x12q0kr5yvcsdjjgyy3";
  };

  buildInputs = [
    ncurses curl
  ];

  installPhase = ''
    mkdir -p $out/bin
    mv nagnu $out/bin/nagnu
  '';

  meta = with stdenv.lib; {
    description = "Ncurses Nagios Dashboard";
    homepage = https://github.com/frlen/nagnu;
    #maintainers = [ maintainers.koral ];
  };

}

