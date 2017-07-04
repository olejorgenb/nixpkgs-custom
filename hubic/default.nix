{ mono, sqlite, stdenv, fetchurl, makeWrapper }:

let
  version = "2.1.0.53";
in

stdenv.mkDerivation {
  name = "hubic-${version}";
  src = fetchurl {
    url = "http://mir7.ovh.net/ovh-applications/hubic/hubiC-Linux/2.1.0/hubiC-Linux-${version}-linux.tar.gz";
    sha256 = "9f1e0c5ae37487f9885e9fa2726ccd5af052b9fb63758b159c3fc4f09b8870f3";
  };

  buildInputs = [ makeWrapper sqlite mono ];

  configurePhase = ''
    installFlagsArray=( "PREFIX=$out" "DBUSSERVICE_DIR=$out/share/dbus-1/services" )
  '';

  postInstall = ''
    for prog in $out/bin/hubic $out/lib/hubic/hubic-service; do

      wrapProgram "$prog" \
          --prefix LD_LIBRARY_PATH ":" "${stdenv.lib.makeLibraryPath [ sqlite ]}" \
          --prefix PATH ":" "${mono}/bin" 
    done
  '';

  # Nothing is really built (so prevent the default make phase from calling make)
  buildPhase = "true";

  meta = {
    description = "A online storage solution similar to dropbox";
    homepage = "https://hubic.com";
    licence = stdenv.lib.licence.unfree;
    platforms = stdenv.lib.platforms.linux;
  };
}
