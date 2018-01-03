{ fetchFromGitHub, fetchurl, python, pymdown-extensions }:

  with python.pkgs; let
    # mkdocs as python library only required by install
    mkdocs = buildPythonPackage {
      name = "mkdocs-0.17.2";
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
        url = "https://pypi.python.org/packages/27/0a/bb42cda3b298ffb4b30375b7538a4d57803ff8be418ee3e00460188c4332/mkdocs-0.17.2.tar.gz";
        sha256 = "18d3m9iws5shlbg0yj5xwiy68bliiz70v32y5pa8wi274c36nssa";
      };
    };

  in buildPythonApplication rec {
    name = "mkdocs-material-2.2.6";

    src = fetchFromGitHub {
      owner = "squidfunk";
      repo = "mkdocs-material";
      rev = "6d9a48fc804715744618d0a22403804be48487a8";
      sha256 = "08hrq743fvvygqllgvj9id7c7chb7l3nh5lq5xzns8zkfvw3rqf6";
    };

    doCheck = false;

    buildInputs = [ pymdown-extensions mkdocs pygments ];
    propagatedBuildInputs = [ ];

    meta = {
      homepage = "https://squidfunk.github.io/mkdocs-material/";
      description = "A Material Design theme for MkDocs";
    };
  }