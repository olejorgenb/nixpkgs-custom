{ fetchFromGitHub, stdenv }:

let
  version = "0.6.2";
in

stdenv.mkDerivation {
  name = "prll-${version}";
  src = fetchFromGitHub {
    owner = "exzombie";
    repo = "prll";
    rev = "prll-${version}";
    sha256 = "01jdm4xqgj9yw7pji6wn0idhsw2kh5bxk9hjz3zbghbibkq6ysil";
  };

  installPhase = ''
    mkdir -p $out/libexec
    install prll_qer prll_bfr $out/libexec
    mkdir -p $out/share/prll
    install prll.sh $out/share/prll
    mkdir -p $out/bin

    runHook postInstall
  '';

  # PROBLEM: how to make prll.sh easily available to users?
  #          Used a similar pattern to the one employed by fzf
  postInstall = ''
    substituteInPlace $out/share/prll/prll.sh \
      --replace prll_qer $out/libexec/prll_qer \
      --replace prll_bfr $out/libexec/prll_bfr

    cat <<SCRIPT > $out/bin/prll-path
    #!/bin/sh
    # Run `source "$(prll-path)"` in your shell init script to acivate `prll`
    echo $out/share/prll/prll.sh
    SCRIPT
    chmod +x $out/bin/prll-path
 
  '';
}
