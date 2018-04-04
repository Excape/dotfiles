{ python, fetchurl }:
  with python.pkgs;
  buildPythonPackage {
    name = "records-0.5.2";
    doCheck = false;
    propagatedBuildInputs = [
      sqlalchemy
      tablib
      docopt
      unicodecsv
      psycopg2
    ];
    src = fetchurl {
      url = "https://pypi.python.org/packages/89/f8/aec41f062568eb8a027f26fe1d2aaa30441e6bbe65896f7ad70dd5cc895e/records-0.5.2.tar.gz";
      sha256 = "11inmhiggw3skab9g1cp9bdpi7kx0ayrbcdvjd275fzgx0svm313";
    };
  }