{ fetchFromGitHub, stdenv, texinfo, autoreconfHook, gperf, flex, bison }:

stdenv.mkDerivation rec {

  version = "v0.4.1";
  name = "dateutils-${version}";

  src = fetchFromGitHub {
    owner = "hroptatyr"; 
    repo = "dateutils";
    rev = version;
    sha256 = "1cab2l06cbrfa52g8zlbfp55pmfk23g2c6y3pfgmhhlpy2nc5n2g";
  };

  buildInputs = [ texinfo autoreconfHook gperf flex bison ];

  meta = {
    description = "Nifty command line date and time utilities; fast date calculations and conversion in the shell";
    homepage = "http://www.fresse.org/dateutils/";
    license = stdenv.lib.licenses.bsd3;
  };

}
