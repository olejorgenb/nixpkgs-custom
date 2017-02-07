{ stdenv, gnused, fetchgit, python3, xorg }:

stdenv.mkDerivation rec {
  name = "font-tewi-unstable-2017-02-07";
  src = fetchgit (builtins.fromJSON ''
      {
        "url": "https://github.com/lucy/tewi-font.git",
        "rev": "d711d86c491dba5cf7b0412e2cf2d219900a1805",
        "sha256": "1axv9bv10xlcmgfyjh3z5kn5fkg3m6n1kskcs5hvlmyb6m1zk91j"
      }
  '');
  buildInputs = [ gnused python3 xorg.bdftopcf xorg.mkfontscale xorg.mkfontdir ];
  patchPhase = ''
    # This isn't build-time actions
    sed -i Makefile \
          -e "/^	*fc-cache/d" \
          -e "/^	*xset/d"
  '';
  installPhase = ''
    make var
    make all
    make fontdir
    install -T -Dm644 "LICENSE" "$out/usr/share/licenses/${name}/LICENSE"
    install -d -m755 "$out/usr/share/fonts/misc/"
    install -m644 -t "$out/usr/share/fonts/misc/" out/*.pcf.gz out/{fonts.scale,fonts.dir}
  '';
}
