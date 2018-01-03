{ fetchurl, python }:

with python.pkgs; buildPythonPackage rec {
    name = "pymdown-extensions-4.7";
    doCheck = false;
    propagatedBuildInputs = [
        markdown
    ];
    src = fetchurl {
        url = "https://pypi.python.org/packages/95/08/0e3eaddb5549714234d1e21c3467da78d203841179a2141fefdb10ae18b5/pymdown-extensions-4.7.tar.gz";
        sha256 = "1a840d1dnc9nbl8zx2k2rap3cxq879p8gzs8r1lbdzswp9kp3fdx";
    };
}