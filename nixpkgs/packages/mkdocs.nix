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

in buildPythonApplication rec {
    pname = "mkdocs";
    version = "0.17.2";
    name = "${pname}-${version}";

    src = fetchFromGitHub {
        owner = "mkdocs";
        repo = "mkdocs";
        rev = version;
        sha256 = "0hpjs9qj0nr57a249yv8xvl61d3d2rrdfqxp1fm28z77l2xjj772";
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
