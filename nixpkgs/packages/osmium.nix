{ python, fetchurl, boost, zlib, bzip2, expat }:

with python.pkgs; let
  boost_python = boost.override {
    inherit python; # use boost with correct python version
  };
in buildPythonPackage rec {
    pname = "osmium";
    version = "2.13.0";
    name = "${pname}-${version}";

    src = fetchPypi {
      inherit pname version;
      sha256 = "1rrww3ys43v3wrl44fggz1qlhmjc1pyqaa46s7ixs80ilf7kqlkh";
    };

    doCheck = false;

    checkInputs = [ nose ];
    checkPhase = ''
      ${python.interpreter} test/run_tests.py                                         #*/
    '';

    buildInputs = [
      boost_python
      zlib
      bzip2
      expat
    ];

    meta = {
        homepage = http://osmcode.org/pyosmium/;
        description = "Python bindings for libosmium, the data processing library for OSM data";
    };
  }
