 { stdenv, fetchgit, pythonPackages, python }:


pythonPackages.buildPythonPackage rec {
  name = "selfspy-${version}";
  version = "unstable-2016-02-07";

  # buildPythonPackage builds for each interpreter unless 'disabled' are true
  # Famous last words, but we'll do it simple now and only build for 2.7
  # 3.x is not supported
  disabled = !(pythonPackages.isPy27);

  src = fetchgit {
    url = "https://github.com/gurgeh/selfspy.git";
    rev = "a98a9c06d14b6f8b6ad76948ab75a2f09c89c578";
    sha256 = "0d0qvq7s229pcdp11bpwgganj94yh6c22s8qyb0gb7vcn3dydxb3";
  };

  propagatedBuildInputs = with pythonPackages; [
    python
    xlib
    sqlalchemy
    lockfile
    pycrypto
    keyring
    tkinter
  ];

  meta = with stdenv.lib; {
    description = "Log everything you do on the computer, for statistics, future reference and all-round fun!";
    homepage = "https://github.com/gurgeh/selfspy";
    maintainers = [ maintainers.olejorgenb ];
    license = licenses.gpl3;
  };
}
