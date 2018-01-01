rec {
  packageOverrides = defaultPkgs: with defaultPkgs; {
    mytexlive = with pkgs; texlive.combine {
      inherit (texlive) scheme-small collection-langgerman
      IEEEtran
      collection-fontsrecommended
      collection-latex
      collection-latexextra
      tracklang;
    };

    terminal = with pkgs; buildEnv {
      name = "terminal";
      paths = [ termite ];
    };

    windowManagerTools = with pkgs; buildEnv {
      name = "windowManagerTools";
      paths = [ 
        feh
        redshift
        shutter
        polybar
      ];
    };


    desktopApps = with pkgs; buildEnv {
      name = "desktopApps";
      paths = [ 
        firefox
        keepassx-community
        thunderbird
        xfce.thunar
        nextcloud-client
      ];
    };

    latex = with pkgs; buildEnv {
      ignoreCollisions = true;
      name = "latex";
      paths = [ mytexlive gentium-book-basic pythonPackages.pygments ];
    };
  };
}
