{ pkgs, pythonPackages }:

  let
    # dependencies which are not present in nixpkgs
    pyasn1 = with pythonPackages; buildPythonPackage rec {
      name = "pyasn1-0.4.2";
      doCheck = false;
      src = pkgs.fetchurl {
        url = "https://pypi.python.org/packages/eb/3d/b7d0fdf4a882e26674c68c20f40682491377c4db1439870f5b6f862f76ed/pyasn1-0.4.2.tar.gz";
        sha256 = "05bxnr4wmrg62m4qr1pg1p3z7bhwrv74jll3k42pgxwl36kv0n6j";
      };
    };

    pysmb = with pythonPackages; buildPythonPackage rec {
      name = "pysmb-1.1.22";
      doCheck = false;
      propagatedBuildInputs = [
        pyasn1
      ];
      src = pkgs.fetchurl {
        url = "https://pypi.python.org/packages/be/83/0356cbb096e2934cd01f8049212f16cde114bbe19c7839f795255c741969/pysmb-1.1.22.zip";
        sha256 = "1g4lqqn87zpys09inn02jmr054grb8bx7fzmqzb6fdm6jmdqvddi";
      };
    };

    in with pythonPackages; buildPythonPackage rec {
      name = "openhsr-connect-0.1.15";

      src = pkgs.fetchFromGitHub {
        owner = "openhsr";
        repo = "connect";
        rev = "bb479bcef1e53773cc11f0fe171ecd26a2b3e2ea";
        sha256 = "0dxv21ijh4bbkqzdgdglg698f8sailw0v40zbfn3bjmzw6xw2qvs";
      };

      doCheck = false;

      propagatedBuildInputs = [ pysmb click ruamel_yaml keyring jsonschema ];

      meta = {
        homepage = "https://github.com/openhsr/connect";
        description = "Die Offene HSR-Mapper Alternative";
      };
    }