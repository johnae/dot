{ stdenv, fetchgit, gnumake, gcc, wget, perl, cacert }:

stdenv.mkDerivation rec {
  version = "0.9.5-pre1";
  name = "spook-${version}";
  SPOOK_VERSION = version;

  src = fetchgit {
    url = https://github.com/johnae/spook.git;
    rev = "ec5be50ca6d18874187492576e2b5fd4dfbcdd90";
    sha256 = "1ilamaj0lcrvncqmvgv3aqvvmvw7sqf0xqx1hk8ja6198djv07ha";
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
