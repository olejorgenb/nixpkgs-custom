with import <nixpkgs> {};

rec {
  data_hacks = callPackage ./data_hacks {} ;
  gpp = callPackage ./gpp {} ;
  idle_logger = callPackage ./idle_logger {} ;
  zsh-completions = callPackage ./zsh-completions {} ;
  notion = callPackage ./notion { enableXft = false; } ;
  selfspy = callPackage ./selfspy {} ;
}
