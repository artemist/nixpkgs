{ stdenv
, lib
, pkgsCross
, clangStdenv
, fetchFromGitHub
, cmake
, pkg-config
, SDL2
, libepoxy
, binutils-unwrapped
, nasm
, python3
, cpu ? if stdenv.targetPlatform.system == "aarch64-linux" then "cortex-a72" else "native"
}:

clangStdenv.mkDerivation rec {
  pname = "fex-emu";
  version = "2206";
  src = fetchFromGitHub {
    owner = "fex-emu";
    repo = "fex";
    rev = "FEX-${version}";
    fetchSubmodules = true;
    sha256 = "sha256-jNH76suIJB7IQ9lF8IyCx3Twt3wndHW1UvuegnyD24k=";
  };

  cmakeFlags = [
    "-DOVERRIDE_VERSION=${version}"
    "-DTUNE_CPU=${cpu}"
    "-DCMAKE_VERBOSE_MAKEFILE=ON"
    "-DCMAKE_C_COMPILER_AR=${binutils-unwrapped}/bin/ar"
    "-DCMAKE_CXX_COMPILER_AR=${binutils-unwrapped}/bin/ar"
    "-DCMAKE_C_COMPILER_RANLIB=${binutils-unwrapped}/bin/ranlib"
    "-DCMAKE_CXX_COMPILER_RANLIB=${binutils-unwrapped}/bin/ranlib"
    "-DX86_C_COMPILER=${pkgsCross.gnu64.buildPackages.gcc}/bin/x86_64-unknown-linux-gnu-gcc"
    "-DX86_CXX_COMPILER=${pkgsCross.gnu64.buildPackages.gcc}/bin/x86_64-unknown-linux-gnu-g++"
  ];

  nativeBuildInputs = [ cmake pkg-config nasm python3 ];

  buildInputs = [ SDL2 libepoxy ];

  doCheck = true;

  meta = with lib; {
    description = "Run x86 and x86-64 binaries on an AArch64 host, similar to qemu-user and box86";
    homepage = "https://fex-emu.org/";
    license = licenses.mit;
    maintainers = with maintainers; [ artemist ];
    platforms = [ "aarch64-linux" ];
  };
}

