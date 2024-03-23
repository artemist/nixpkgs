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
  crossGcc32 = pkgsCross.gnu32.buildPackages.gcc;
  crossGcc64 = pkgsCross.gnu64.buildPackages.gcc;
  thunkDeps = [
    alsa-lib
    libdrm
    libglvnd
    vulkan-headers
    wayland
    xorg.libX11
    xorg.libXau
    xorg.libXdmcp
    xorg.libXext
    xorg.libXfixes
    xorg.libXrandr
    xorg.libXrender
    xorg.libxcb
    xorg.libxshmfence
    xorg.xorgproto
    xorg.xtrans
  ];

  thunkDepIncludeFlags = lib.concatStringsSep " "
    (map (pkg: "-I${lib.getDev pkg}/include") thunkDeps);
  thunkDepLibFlags = lib.concatStringsSep " "
    (map (pkg: "-L${lib.getLib pkg}/lib") thunkDeps);
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
    libffi
    libxml2
    ncurses
    openssl
    zlib
  ] ++ lib.optionals buildThunks thunkDeps;

  patches = lib.optional buildThunks ./thunkgen-cflags-environment.patch;

  preConfigure = ''
    export AR=llvm-ar
    export RANLIB=llvm-ranlib
    export STRIP=llvm-strip
  '' + lib.optionalString buildThunks ''
    substituteInPlace toolchain_x86_32.cmake \
      --replace x86_64-linux-gnu- ${crossGcc32}/bin/${crossGcc32.targetPrefix}

    substituteInPlace toolchain_x86_64.cmake \
      --replace x86_64-linux-gnu- ${crossGcc64}/bin/${crossGcc64.targetPrefix}

    THUNKGEN_HOST_ARGS="${thunkDepIncludeFlags} ${thunkDepLibFlags}"
    THUNKGEN_HOST_ARGS+=" $(< ${stdenv.cc}/nix-support/cc-cflags)"
    THUNKGEN_HOST_ARGS+=" $(< ${stdenv.cc}/nix-support/libc-cflags)"
    THUNKGEN_HOST_ARGS+=" $(< ${stdenv.cc}/nix-support/libcxx-cxxflags)"
    export THUNKGEN_HOST_ARGS

    THUNKGEN_GUEST_32_ARGS="${thunkDepIncludeFlags}"
    THUNKGEN_GUEST_32_ARGS+=" $(< ${crossGcc32}/nix-support/cc-cflags)"
    THUNKGEN_GUEST_32_ARGS+=" $(< ${crossGcc32}/nix-support/libc-cflags)"
    THUNKGEN_GUEST_32_ARGS+=" $(< ${crossGcc32}/nix-support/libcxx-cxxflags)"
    export THUNKGEN_GUEST_32_ARGS

    THUNKGEN_GUEST_64_ARGS="${thunkDepIncludeFlags}"
    THUNKGEN_GUEST_64_ARGS+=" $(< ${crossGcc64}/nix-support/cc-cflags)"
    THUNKGEN_GUEST_64_ARGS+=" $(< ${crossGcc64}/nix-support/libc-cflags)"
    THUNKGEN_GUEST_64_ARGS+=" $(< ${crossGcc64}/nix-support/libcxx-cxxflags)"
    export THUNKGEN_GUEST_64_ARGS
  '';

  env = lib.optionalAttrs buildThunks {
    # libclang in thunkgen requires llvm includes
    # Ordinarily, this would be in depsBuildBuild but
    # doing so sets our compiler to be clang-unwrapped,
    # so put the include here.
    # clang won't give us __neon_vector_type__ without -march
    NIX_CFLAGS_COMPILE = "-I${llvmPackages.libllvm.dev}/include -march=armv8-a";
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
