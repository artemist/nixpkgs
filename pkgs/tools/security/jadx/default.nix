{ stdenv, fetchurl, gradle, perl, makeWrapper, jre, makeDesktopItem, writeText, runtimeShell, buildFHSUserEnv, bash }:

let
  version = "0.9.0";
  name = "jadx-${version}";

  src = fetchurl {
    url    = "https://github.com/skylot/jadx/archive/v${version}.tar.gz";
    sha256 = "07q18773bnk4rf2dggyx3iavpdcd6rin8b89sf8vgs6gaybyh1ji";
  };

  # We need a user env because the build step needs to execute a downloaded executable
  userEnv = buildFHSUserEnv {
    name = "${name}-build-env";
    targetPkgs = pkgs: with pkgs; [ gradle jre zlib ];
    runScript = "bash";
  };

  deps = stdenv.mkDerivation {
    name = "${name}-deps";
    inherit src;
    nativeBuildInputs = [ gradle perl ];

    # Run both the build and jar phases here, so that it caches the dependencies
    buildPhase = ''
      export GRADLE_USER_HOME=$(mktemp -d);
      export JADX_VERSION=${version}
      ${userEnv}/bin/${userEnv.name} -c "gradle --build-cache --no-daemon dist"
    '';

    # Mavenize dependency paths
    # e.g. org.codehaus.groovy/groovy/2.4.0/{hash}/groovy-2.4.0.jar -> org/codehaus/groovy/groovy/2.4.0/groovy-2.4.0.jar
    installPhase = ''
      find $GRADLE_USER_HOME/caches/modules-2 -type f -regex '.*\.\(jar\|pom\)' \
        | perl -pe 's#(.*/([^/]+)/([^/]+)/([^/]+)/[0-9a-f]{30,40}/([^/\s]+))$# ($x = $2) =~ tr|\.|/|; "install -Dm444 $1 \$out/$x/$3/$4/$5" #e' \
        | sh
    '';

    outputHashAlgo = "sha256";
    outputHashMode = "recursive";
    outputHash = "1bw9a8qh6vr998v1z772604zz3rapf179si8bjnc9vlckfnx2afy";
  };

  # Point to our local deps repo
  gradleInit = writeText "init.gradle" ''
    logger.lifecycle 'Replacing Maven repositories with ${deps}...'

    gradle.projectsLoaded {
      rootProject.allprojects {
        buildscript {
          repositories {
            clear()
            maven { url '${deps}' }
          }
        }
        repositories {
          clear()
          maven { url '${deps}' }
        }
      }
    }
  '';

  desktopItem = launcher: makeDesktopItem {
    name = "jadx-gui";
    exec = "${launcher} %F";
    comment = "Java Decompiler";
    desktopName = "jadx GUI";
    genericName = "Java and Android Decompiler";
    mimeType = "application/x-java-archive;application/x-java";
    categories = "Development;Debugger;";
  };

in stdenv.mkDerivation rec {
  inherit name version src;

  nativeBuildInputs = [ gradle perl makeWrapper ];

  buildPhase = ''
    export GRADLE_USER_HOME=$(mktemp -d)
    export JADX_VERSION=${version}
    ${userEnv}/bin/${userEnv.name} -c "gradle --offline --no-daemon --info --init-script ${gradleInit} dist"
  '';

  installPhase = let
    jar = "$out/share/jadx/${name}.jar";
  in ''
    mkdir -p $out/bin $out/share/{jadx,icons/hicolor/128x128/apps}
    cp build/libs/${name}.jar ${jar}
    cp src/linux/resources/jd_icon_128.png $out/share/icons/hicolor/128x128/apps/jadx.png

    cat > $out/bin/jadx <<EOF
    #!${runtimeShell}
    export JAVA_HOME=${jre}
    ${jre}/bin/java -jar ${jar} $@
    EOF
    chmod +x $out/bin/jadx

    ${(desktopItem "$out/bin/jadx").buildCommand}
  '';

  dontStrip = true;

  meta = with stdenv.lib; {
    description = "Dex to Java decompiler";
    homepage    = "https://github.com/skylot/jadx";
    license     = licenses.apl2;
    platforms   = platforms.unix;
    maintainers = [ maintainers.artemist ];
  };
}
