{ lib
, python3
, fetchFromGitHub
, sdcc
, yosys
, icestorm
, nextpnr
}:

python3.pkgs.buildPythonApplication rec {
  pname = "glasgow";
  version = "0.1-dev20231223+${lib.substring 0 7 src.rev}";

  format = "pyproject";

  src = fetchFromGitHub {
    owner = "GlasgowEmbedded";
    repo = "glasgow";
    rev = "ebd3ba3c68248dcad09f1af8d7809db89b119468";
    sha256 = "sha256-UFfnDZta/R8ElVbEbRle1muVbpeE/JdFJ/D8cA0VFHs=";
  };

  nativeBuildInputs = [
    python3.pkgs.pdm-backend
    python3.pkgs.unittestCheckHook
    sdcc
  ];

  propagatedBuildInputs = with python3.pkgs; [
    aiohttp
    amaranth
    fx2
    libusb1
    packaging
    platformdirs
    pyvcd
  ];

  nativeCheckInputs = [ yosys icestorm nextpnr ];

  enableParallelBuilding = true;

  preBuild = ''
    make -C firmware LIBFX2=${python3.pkgs.fx2}/share/libfx2
    cp firmware/glasgow.ihex software/glasgow
    cd software
    export SETUPTOOLS_SCM_PRETEND_VERSION="${version}"
  '';

  # installCheck tries to build_ext again
  doInstallCheck = false;

  postInstall = ''
    mkdir -p $out/etc/udev/rules.d
    cp $src/config/70-glasgow.rules $out/etc/udev/rules.d
    cp $src/config/70-cypress.rules $out/etc/udev/rules.d
  '';

  preCheck = ''
    # tests attempt to cache bitstreams
    # for linux:
    export XDG_CACHE_HOME=$TMPDIR
    # for darwin:
    export HOME=$TMPDIR
  '';

  makeWrapperArgs = [
    "--set" "YOSYS" "${yosys}/bin/yosys"
    "--set" "ICEPACK" "${icestorm}/bin/icepack"
    "--set" "NEXTPNR_ICE40" "${nextpnr}/bin/nextpnr-ice40"
  ];

  meta = with lib; {
    description = "Software for Glasgow, a digital interface multitool";
    homepage = "https://github.com/GlasgowEmbedded/Glasgow";
    license = licenses.bsd0;
    maintainers = with maintainers; [ emily thoughtpolice ];
    mainProgram = "glasgow";
  };
}
