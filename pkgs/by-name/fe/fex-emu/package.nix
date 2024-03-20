{
  lib,
  llvmPackages,
  fetchFromGitHub,
  cmake,
  ninja,
  pkg-config,
  pkgsCross,
  nasm,
  python3,
  SDL2,
  libepoxy,
  openssl,
  libffi,
  ncurses,
  libxml2,
  xorg,
  zlib,
  libglvnd,
  alsa-lib,
  libdrm,
  wayland,
  vulkan-headers,
  buildThunks ? true,
}:

let
  stdenv = llvmPackages.stdenv;
  crossGcc = pkgsCross.gnu64.buildPackages.gcc;
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
    libffi
    ncurses
    libxml2
    zlib
  ] ++ lib.optionals buildThunks [
    alsa-lib
    libdrm
    libglvnd
    vulkan-headers
    wayland
    xorg.libX11
    xorg.libXau
    xorg.libXdmcp
    xorg.libXext
    xorg.libXrender
    xorg.libXfixes
    xorg.libxcb
    xorg.libxshmfence
  ];

  preConfigure = ''
    export AR=llvm-ar
    export RANLIB=llvm-ranlib
    export STRIP=llvm-strip
  '' + lib.optionalString buildThunks ''
    substituteInPlace toolchain_x86_{32,64}.cmake \
      --replace x86_64-linux-gnu- ${crossGcc}/bin/${crossGcc.targetPrefix}
  '';

  env = lib.optionalAttrs buildThunks {
    # libclang in thunkgen requires llvm includes
    # Ordinarily, this would be in depsBuildBuild but
    # doing so sets our compiler to be clang-unwrapped,
    # so put the include here.
    NIX_CFLAGS_COMPILE = "-I${llvmPackages.libllvm.dev}/include";
  };

  cmakeFlags = [
    "-DOVERRIDE_VERSION=${version}"
    "-DENABLE_LTO=True"
  ] ++ lib.optionals buildThunks [
    "-DBUILD_THUNKS=True"
    # For thunk generation
    "-DClang_DIR=${llvmPackages.libclang.dev}/lib/cmake/clang"
    "-DLLVM_DIR=${llvmPackages.libllvm.dev}/lib/cmake/llvm"
  ];

  doCheck = true;

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
