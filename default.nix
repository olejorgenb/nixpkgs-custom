with import <nixpkgs> {};

# This includes some private/local-source packages but since nix is a lazy
# evaluated language there's no error unless the package is attempted installed

rec {
  data_hacks = callPackage ./data_hacks {} ;
  gpp = callPackage ./gpp {} ;
  idle_logger = callPackage ~/src/idle_logger {} ;
  zsh-completions = callPackage ./zsh-completions {} ;
  notion = callPackage ./notion { enableXft = false; } ;
  selfspy = callPackage ./selfspy {} ;
}
