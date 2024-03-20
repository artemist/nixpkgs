{
  lib,
  llvmPackages,
  fetchFromGitHub,
  cmake,
  ninja,
  pkg-config,
  nasm,
  python3,
  SDL2,
  libepoxy,
  openssl,
  squashfsTools,
  squashfuse,
}:

let
  stdenv = llvmPackages.stdenv;
in
stdenv.mkDerivation rec {
  pname = "fex-emu";
  version = "2403";

  src = fetchFromGitHub {
    owner = "FEX-Emu";
    repo = "FEX";
    rev = "FEX-${version}";
    fetchSubmodules = true;
    hash = "sha256-++Pj34u14uDh7S9tIYjVbvjm/ZsPZhcQVhBJE130aTs=";
  };

  nativeBuildInputs = [
    cmake
    ninja
    pkg-config

    python3
    python3.pkgs.setuptools

    stdenv.cc.cc.libllvm.out
    nasm
  ];

  buildInputs = [
    SDL2
    libepoxy
    openssl
    squashfuse
    squashfsTools
  ];

  preConfigure = ''
    export AR=llvm-ar
    export RANLIB=llvm-ranlib
    export STRIP=llvm-strip
  '';

  cmakeFlags = [
    "-DOVERRIDE_VERSION=${version}"
    "-DENABLE_LTO=True"
  ];

  meta = with lib; {
    description = "A fast usermode x86 and x86-64 emulator for Arm64 Linux";
    homepage = "https://fex-emu.com/";
    platforms = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    license = licenses.mit;
    maintainers = with maintainers; [ artemist ];
  };
}
