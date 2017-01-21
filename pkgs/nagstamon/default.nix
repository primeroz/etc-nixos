#
{ stdenv, fetchFromGitHub, go, git }:

stdenv.mkDerivation rec {
  version = "master";
  name = "Nagstamon-${version}";

  src = fetchFromGitHub {
    owner = "HenriWahl";
    repo = "Nagstamon";
    rev = "master";
    sha256 = "1rxh656cbxcqg4x2nsshn24w3c841a4pw5xpxq0zm3nm89n78iyn";
  };

  meta = with stdenv.lib; {
    description = "Nagstamon - Desktop nagios status monitor";
    homepage = https://github.com/HenriWahl/Nagstamon;
    #maintainers = [ maintainers.koral ];
  };

}

