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
  version = "master";
  name = "hugo-${version}";

  src = fetchFromGitHub {
    owner = "spf13";
    repo = "hugo";
    #rev = "v${version}";
    rev = "${version}";
    #sha256 = "1h5d7m019r4zhk7xlcdbn4z3w6x7jq2lcdgq7w377688rk58wbgp";
    sha256 = "10kn93l9fnmfkr39vf5skivgikk2kkj8r66rxb0r8wy3bfa1s8ra";
  };

  buildInputs = [ go git ];

  buildPhase = ''
    mkdir -p src/github.com/spf13
    ln -s $(pwd) src/github.com/spf13/hugo
    export GOPATH=$(pwd)
    export GOBIN=$(pwd)/bin
    go get -v
    go build -v
  '';

  installPhase = ''
    mkdir -p $out/bin
    #mv hugo-v${version}-src $out/bin/hugo
    mv hugo-${version}-src $out/bin/hugo
  '';

  meta = with stdenv.lib; {
    description = "hugo";
    homepage = https://github.com/spf13/hugo;
    #maintainers = [ maintainers.koral ];
  };

}

