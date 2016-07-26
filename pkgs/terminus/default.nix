#{ goBuild, fetchFromGitHub, ... }:
#
#goBuild {
#  name = "terminus-0.1.0";
#  goPackagePath = "github.com/jtopjian/terminus";
#  src = fetchFromGitHub {
#    owner = "jtopjian";
#    repo = "terminus";
#    rev = "v0.1.0";
#    sha256 = "0gdyvnrfzlzf56k1jmbm3r1a46wi0ac4461f1qc4pcdv452d9g1a";
#  };
#
#}

{ stdenv, fetchFromGitHub, go, git }:

stdenv.mkDerivation rec {
  version = "0.1.0";
  name = "terminus-${version}";

  src = fetchFromGitHub {
    owner = "jtopjian";
    repo = "terminus";
    rev = "v${version}";
    sha256 = "0gdyvnrfzlzf56k1jmbm3r1a46wi0ac4461f1qc4pcdv452d9g1a";
  };

  buildInputs = [ go git ];

  buildPhase = ''
    mkdir -p src/github.com/jtopjian
    ln -s $(pwd) src/github.com/jtopjian/terminus
    export GOPATH=$(pwd)
    export GOBIN=$(pwd)/bin
    go get -v
    go build -v
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv terminus-v${version}-src $out/bin/terminus
  '';

  meta = with stdenv.lib; {
    description = "Terminus - Get facts about system";
    homepage = https://github.com/jtopjian/terminus;
    #maintainers = [ maintainers.koral ];
  };

}

