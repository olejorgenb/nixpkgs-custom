{ stdenv, lua5_0, pkgconfig, fetchurl }:

# TODO:
# - Run tests
# - Install documentation (man pages etc.)
# - What about gel?

let
  lua = lua5_0;
in

stdenv.mkDerivation {
  name = "gema-1.4rc";

  src = fetchurl {
    url = "mirror://sourceforge/gema/gema-1.4RC-src.tgz";
    sha256="6581f7acae049b5a02ace66b1a8f5b689f22320521e7df448b7294a9e13cc6f5";
  };

  buildInputs = [ lua pkgconfig ];

  patches = [
      ./more-configure-control-olejorgenb.patch
      # ./patches-from-sourceforge/thomas-1-lua5.1_amd64.patch
      # ./patches-from-sourceforge/thomas-2-gua-5.1.patch
      # ./patches-from-sourceforge/thomas-3-static_and_lua.patch
  ];

  configurePhase = ''
    cd src

    export LUALIBPATH=$(pkg-config --variable=INSTALL_LIB lua)
    export LUAINCPATH=$(pkg-config --variable=INSTALL_INC lua)
    # export LUALIBPATH="${lua.outPath}/lib"
    # export LUAINCPATH="${lua.outPath}/include"
    export INSTALLDIR="$out"
    sh gbuild config
  '';

  preInstall = ''
    mkdir -p $out/bin
  '';

  meta = {
    homepage = "http://gema.sourceforge.net/";
    description = "General purpose text processing utility based on the concept of pattern matching";
    # According to sourceforge. (The source files basically say "do whatever you
    # want)"
    license = stdenv.lib.licenses.mit;
  };
}
