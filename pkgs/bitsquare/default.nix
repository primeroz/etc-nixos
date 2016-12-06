{ stdenv, fetchFromGitHub, jdk }:

stdenv.mkDerivation rec {
  version = "0.4.9.2";
  name = "bitsquare-${version}";

  src = fetchFromGitHub {
    owner = "bitsquare";
    repo = "bitsquare";
    rev = "v${version}";
    sha256 = "0gdyvnrfzlzf56k1jmbm3r1a46wi0ac4461f1qc4pcdv452d9g1a";
  };

  buildInputs = [ jdk git ];

  buildPhase = ''
    mkdir -p src/github.com/bitsquare
    ln -s $(pwd) src/github.com/bitsquare/bitsquare
    export GOPATH=$(pwd)
    export GOBIN=$(pwd)/bin
    go get -v
    go build -v
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv bitsquare-v${version}-src $out/bin/terminus
  '';

  meta = with stdenv.lib; {
    description = "bitsquare - Get facts about system";
    homepage = https://github.com/bitsquare/bitsquare;
    #maintainers = [ maintainers.koral ];
  };

}

