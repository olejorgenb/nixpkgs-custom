 {
  pythonPackages
 }:


pythonPackages. buildPythonPackage {
  name = "selfspy";
  # buildPythonPackage build for each interpreter unless 'disabled' are true
  # Famous last words, but we'll do it simple now and only build for 2.7
  # 3.x is not supported
  disabled = !(pythonPackages.isPy27);

  src = ~/src/selfspy;

  propagatedBuildInputs = with pythonPackages; [
    xlib
    sqlalchemy9
    lockfile
    pycrypto
    keyring
    tkinter
  ];

  meta = {
    description = "Log everything you do on the computer, for statistics, future reference and all-round fun!";
    homepage = "https://github.com/gurgeh/selfspy";
    license = "GPLv3";
  };
}
