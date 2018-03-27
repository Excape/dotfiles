{ fetchFromGitHub, fetchurl, python, pymdown-extensions }:

  with python.pkgs; let
    livereload = buildPythonPackage {
      name = "livereload-2.5.1";
      doCheck = false;
      propagatedBuildInputs = [
        tornado
        six
      ];
      src = fetchurl {
        url = "https://pypi.python.org/packages/e9/2e/c4972828cf526a2e5f5571d647fb2740df68f17e8084a9a1092f4d209f4c/livereload-2.5.1.tar.gz";
        sha256 = "0b2yyfnpddmrwjfqsndidzchkf3l9jlgzfkwl8dplim9gq6y2ba2";
      };
    };

    # mkdocs as python library only required by install
    mkdocs = buildPythonPackage {
      name = "mkdocs-0.17.3";
      doCheck = false;
      propagatedBuildInputs = [
        click
        jinja2
        livereload
        markdown
        pyyaml
        tornado
      ];
      src = fetchurl {
        url = "https://pypi.python.org/packages/8a/cc/593faba2554b0a950249b0240417319de67f3e2ee5b70755c49b70be043a/mkdocs-0.17.3.tar.gz";
        sha256 = "1faga4arlaq5y883zgpfgmf4iqfszmk50dycrkx7gc6y3a3rnvhj";
      };
    };

  in buildPythonApplication rec {
    name = "mkdocs-material-${version}";
    version = "2.7.1";

    src = fetchFromGitHub {
      owner = "squidfunk";
      repo = "mkdocs-material";
      rev = version;
      sha256 = "07dzrnbkyqnwfip6iba7gkvx2idyyij2slm8i27b89sd37ahmv3c";
    };

    doCheck = false;

    buildInputs = [ pymdown-extensions mkdocs pygments ];
    propagatedBuildInputs = [ ];

    meta = {
      homepage = "https://squidfunk.github.io/mkdocs-material/";
      description = "A Material Design theme for MkDocs";
    };
  }