{ stdenv, fetchFromGitHub, go, git }:

stdenv.mkDerivation rec {
  version = "master";
  name = "shell2http-${version}";

  src = fetchFromGitHub {
    owner = "msoap";
    repo = "shell2http";
    rev = "master";
    sha256 = "0r7pr3vgipzr9gs7mznni6kp4zlljsalp596wvblnfwkrkbl0xk4";
  };

  buildInputs = [ go git ];

  buildPhase = ''
    mkdir -p src/github.com/msoap
    ln -s $(pwd) src/github.com/msoap/shell2http
    export GOPATH=$(pwd)
    export GOBIN=$(pwd)/bin
    go get -v
    go build -v
  '';

  installPhase = ''
    mkdir -p $out/bin
    ls -la
    mv shell2http-${version}-src $out/bin/shell2http
  '';

  meta = with stdenv.lib; {
    description = "shell2http - shell over http";
    homepage = https://github.com/msoap/shell2http;
    #maintainers = [ maintainers.koral ];
  };

}

