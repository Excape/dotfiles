{ python, fetchFromGitHub, fetchurl, mkdocs-material, pymdown-extensions }:

with python.pkgs; let
    markdown-math = buildPythonPackage {
        name = "python-markdown-math-0.3";
        doCheck = false;
        src = fetchurl {
            url = "https://pypi.python.org/packages/7c/8b/9f40c484bcefe305db8533e6ea11d977132a80699fed17378fcd2b56e0cf/python-markdown-math-0.3.tar.gz";
            sha256 = "156kfpknwvlyfp7a1n2rlisrp1pn96pc470xkmh18kmmiq0wpff1";
        };
    };
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

in buildPythonApplication rec {
    pname = "mkdocs";
    version = "0.17.3";
    name = "${pname}-${version}";

    src = fetchFromGitHub {
        owner = "mkdocs";
        repo = "mkdocs";
        rev = version;
        sha256 = "15lv60gdc837zja5kn2rfp78kwyb1ckc43jg01zfzqra4qz7b6rw";
    };

    doCheck = false;

    propagatedBuildInputs = [
        tornado
        livereload
        click
        pyyaml
        markdown
        jinja2

        # mkdocs extensions
        pymdown-extensions
        mkdocs-material
        pygments
        markdown-math
    ];

    meta = {
        homepage = http://mkdocs.org/;
        description = "Project documentation with Markdown";
    };
}
