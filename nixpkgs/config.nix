{
  packageOverrides = pkgs: rec {
    mytexlive = with pkgs; texlive.combine {
      inherit (texlive) scheme-small collection-langgerman
      IEEEtran
      collection-fontsrecommended
      collection-latex
      collection-latexextra
      tracklang;
    };

    # overrides
    polybar = pkgs.polybar.override { i3GapsSupport = true; };

    nextcloud-client = pkgs.nextcloud-client.override {
      withGnomeKeyring = true;
      libgnome_keyring = pkgs.gnome3.libgnome_keyring;
    };


    # openhsr-connect
    openhsrConnect = pkgs.callPackage ./packages/openhsr-connect.nix {
      inherit pkgs;
      pythonPackages = pkgs.python36Packages;
    };

    # package environments
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
        sxiv # image viewer
        zathura # pdf viewer
      ];
    };

    latex = with pkgs; buildEnv {
      ignoreCollisions = true;
      name = "latex";
      paths = [
        mytexlive
        gentium-book-basic
        pythonPackages.pygments
      ];
    };
  };
}
