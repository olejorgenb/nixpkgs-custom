{ stdenv, fetchurl, zsh }:

stdenv.mkDerivation rec {
  name = "zsh-completions-${version}";
  version = "0.18.0";
  
  src = fetchurl {
    url = "https://github.com/zsh-users/zsh-completions/archive/${version}.tar.gz";
    sha256 = "0ynvgi3q8ljb8vzmhg2g2z1v08bz4d7swlaxdpma88290hyvckmr";
  };
    
  buildInputs = [ ];

  installPhase= ''
    targetDir=$out/share/zsh/site-functions
    install -D --target-directory=$out/share/zsh/site-functions src/*
  '';  
  
  meta = {
    description = "Additional completion definitions for Zsh";
    homepage = https://github.com/zsh-users/zsh-completions;
    license = "various";
  };
}
