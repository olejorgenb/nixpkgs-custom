with import <nixpkgs> {};

# This includes some private/local-source packages but since nix is a lazy
# evaluated language there's no error unless the package is attempted installed
#
# Note that notion also use a hard-coded source path

rec {
  data_hacks = callPackage ./data_hacks {} ;

  gpp = callPackage ./gpp {} ;

  idle_logger = callPackage ~/src/idle_logger {} ;

  zsh-completions = callPackage ./zsh-completions {} ;

  # Forked from the official nixpkgs
  notion = callPackage ./notion { enableXft = false; } ;

  selfspy = callPackage ./selfspy {} ;

  dateutils = callPackage ./dateutils {} ;

  tewi-font-unstable = callPackage ./tewi-font {} ;
}
