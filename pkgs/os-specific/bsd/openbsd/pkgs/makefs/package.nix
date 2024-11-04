{ mkDerivation, lib, compatHook }:
mkDerivation {
  path = "usr.sbin/makefs";
  extraPaths = [ "sys/sys" "sys/ufs" "sys/msdosfs" "sys/dev" ];

  extraNativeBuildInputs = [ compatHook ];

  preBuild = ''
    export NIX_CFLAGS_COMPILE="$NIX_CFLAGS_COMPILE -I$BSDSRCDIR/sys"
  '';
  meta.platforms = lib.platforms.all;
}
