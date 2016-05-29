{ stdenv, fetchurl }:

let
  version = "2.24";
in
stdenv.mkDerivation {
  name = "gpp-${version}";
  src = fetchurl {
    url = "http://files.nothingisreal.com/software/gpp/gpp-${version}.tar.bz2";
    sha256 = "1g7ns3brl3jxsp5vsyi0n87wfijhgxladarxq38xs5dk9a3xphlv";
  };
  meta = {
    description = "GPP is a general-purpose preprocessor with customizable syntax, suitable for a wide range of preprocessing tasks.";
    homepage = "http://en.nothingisreal.com/wiki/GPP";
    license = stdenv.lib.licenses.gpl2Plus;
  };
}
