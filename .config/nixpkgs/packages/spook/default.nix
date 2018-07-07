{ stdenv, fetchgit, gnumake, gcc, wget, perl, cacert }:

stdenv.mkDerivation rec {
  version = "0.9.5-pre4";
  name = "spook-${version}";
  SPOOK_VERSION = version;

  src = fetchgit {
    url = https://github.com/johnae/spook.git;
    rev = "2458aedb7a177ee60f3dce306a698fe95ced2c56";
    sha256 = "05jnrq4i8ylh241l9qj4ynz1vxjxdhyb9321wm4jwq8baq20nknf";
    fetchSubmodules = true;
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    make install PREFIX=$out
    runHook postInstall
  '';

  buildInputs = [ gnumake gcc wget perl cacert ];

  meta = {
    description = "Lightweight evented utility for monitoring file changes and more";
    homepage = https://github.com/johnae/spook;
    license = "MIT";
  };

}
