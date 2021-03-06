with import <nixpkgs> {};

# This includes some private/local-source packages but since nix is a lazy
# evaluated language there's no error unless the package is attempted installed
#
# Note that notion also use a hard-coded source path

let
  callPackageIfPresent = path: args:
    if builtins.pathExists path then
      callPackage path args
    else
      abort "${toString path} not found"
    ;

in

rec {
  data_hacks = callPackage ./data_hacks {} ;

  gpp = callPackage ./gpp {} ;

  idle_logger = callPackageIfPresent ~/src/idle_logger {} ;

  zsh-completions = callPackage ./zsh-completions {} ;

  # Forked from the official nixpkgs
  notion = callPackage ./notion { enableXft = false; } ;

  selfspy = callPackage ./selfspy {} ;

  # Also in nixpkgs
  dateutils = callPackage ./dateutils {} ;

  tewi-font-unstable = callPackage ./tewi-font {} ;

  way-cooler = callPackage ./way-cooler {} ;

  hubic = callPackage ./hubic {} ;

  prll = callPackage ./prll {} ;

  gema = callPackage ./gema {} ;
  
}
