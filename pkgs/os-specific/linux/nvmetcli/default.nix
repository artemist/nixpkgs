{ stdenv, fetchgit, python3Packages }:

python3Packages.buildPythonApplication rec {
  pname = "nvmetcli";
  version = "0.7";

  src = fetchgit {
    url = "git://git.infradead.org/users/hch/nvmetcli.git";
    rev = "0a6b088db2dc2e5de11e6f23f1e890e4b54fee64";
    sha256 = "00w9z18mgxz7px27mfqa72mjzby9zc79ggg2h4iy2mpygw67p1jj";
  };

  propagatedBuildInputs = with python3Packages; [ configshell ];

  # Requires access to /sys/kernel/config/nvmet
  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "http://git.infradead.org/users/hch/nvmetcli.git";
    description = "Configure NVMe-over-Fabrics Target";
    maintainers = [ maintainers.artemist ];
    license = licenses.asl20;
    platforms = platforms.linux;
  };
}

