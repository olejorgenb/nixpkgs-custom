{ stdenv, buildPythonPackage, pythonPackages, python2, fetchurl }:

let
	version = "0.3.1";
in
  buildPythonPackage {
    name = "data_hacks-${version}";
    # buildPythonPackage build for each interpreter unless 'disabled' are true
    # Famous last words, but we'll do it simple now and only build for 2.7
    # 3.x is not supported
    disabled = !(pythonPackages.isPy27);

    src = fetchurl {
      url = "https://github.com/bitly/data_hacks/archive/v${version}.tar.gz";
      sha256 = "1yjfg806359w1v4p7cm22drx3pjh3abgsbvgsxkq4sms7njgr2hq";
    };

    meta = {
      description = "Command line utilities for data analysis";
      homepage = "https://github.com/bitly/data_hacks";
      license = stdenv.lib.licenses.asl20;
    };
  }
