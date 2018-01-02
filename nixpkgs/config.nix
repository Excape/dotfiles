{
  packageOverrides = defaultPkgs: with defaultPkgs; rec {
    mytexlive = with pkgs; texlive.combine {
      inherit (texlive) scheme-small collection-langgerman
      IEEEtran
      collection-fontsrecommended
      collection-latex
      collection-latexextra
      tracklang;
    };

    i3polybar = pkgs.polybar.override { i3GapsSupport = true; };


    terminal = with pkgs; buildEnv {
      name = "terminal";
      paths = [ termite autojump ];
    };

    windowManagerTools = with pkgs; buildEnv {
      name = "windowManagerTools";
      paths = [ 
        feh
        redshift
        shutter
        i3polybar
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
