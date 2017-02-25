{ stdenv, rustPlatform, wlc, dbus }:

# NB!! doesn't work yet

with rustPlatform;

buildRustPackage {
    name ="way-cooler";
    src = ./.;
    buildInputs = [ wlc dbus ];
    # Based on nixpkgs 4610fc9310947cfea56c9150a1e10d6cac79fa82 and way-cooler: eb15d623dbc816d0f5c9cee3faf5e2a69fa0d6ad
    # When using different commit for the above, just run `nix-shell --expr "with import /path/to/nixpkgs {}; callPackage ./. {}"`
    # That will print out the expected depsSha256 the new revision-set
    depsSha256 = "1rs4wpq3bbbis7z6m2k0xq8pq4ipxdyi0295i5bxybjgmjgjj3s2";
}
