#
{ stdenv, fetchFromGitHub, go, git }:

stdenv.mkDerivation rec {
  version = "master";
  name = "Nagstamon-${version}";

  src = fetchFromGitHub {
    owner = "HenriWahl";
    repo = "Nagstamon";
    rev = "master";
    sha256 = "1fmdganj0pn2xw6mg6rkl04fk6ymi4r71ikl96bpcmp15jpd4y0l";
  };

  meta = with stdenv.lib; {
    description = "Nagstamon - Desktop nagios status monitor";
    homepage = https://github.com/HenriWahl/Nagstamon;
    #maintainers = [ maintainers.koral ];
  };

}

