self: super:
{
    terminal = with self; super.buildEnv {
      name = "terminal";
      paths = [
        termite
        fasd
        bc # calculator
      ];
    };

    windowManagerTools = with self; super.buildEnv {
      name = "windowManagerTools";
      paths = [
        feh
        shutter
        polybar
        i3lock-fancy
        playerctl
        rofi # application launcher
      ];
    };

    desktopApps = with self; super.buildEnv {
      name = "desktopApps";
      paths = [ 
        firefox
        keepassx-community
        keepass
        thunderbird
        libreoffice-fresh
        xfce.thunar
        nextcloud-client
        sxiv # image viewer
        qpdfview # pdf viewer
        gimp
        qgis
        calibre
        masterpdfeditor
      ];
    };

    mediaApps = with self; super.buildEnv {
      name = "mediaApps";
      paths = [
        vlc
        spotify
      ];
    };

    cloudSolApps = with self; super.buildEnv {
      name = "devApps";
      paths = [ 
        eclipse-ee-47
        python # for gcloud
        #google-cloud-sdk
      ];
    };

    devApps = with self; super.buildEnv {
      name = "devApps";
      paths = [ 
        jetbrains.pycharm-professional
        astah-professional
        myVscode
        git-crypt
      ];
    };

    dotNet-dev = with self; super.buildEnv {
      name = "dotNet-dev";
      paths = [
        dotnet-sdk
        jetbrains.rider
      ];
    };


    haskellTools = with self.haskellPackages; super.buildEnv {
      name = "haskellTools";
      paths = [ 
        ghc
      ];
    };

    reactTools = with self; super.buildEnv {
      name = "reactTools";
      paths = [ 
        nodejs-8_x
        flow
        yarn
      ];
    };

    pythonTools = with self; with python36Packages; super.buildEnv {
      name = "pythonTools";
      paths = [ 
        virtualenv
        mkdocs
        mkdocs-material
        # pipenv doesn't work anymore
        flake8
      ];
    };


    # custom latex environment
    mytexlive = with self; super.texlive.combine {
      inherit (texlive) scheme-small collection-langgerman pdfjam
      IEEEtran
      collection-fontsrecommended
      collection-latex
      collection-latexextra
      tracklang;
    };

    latex = with self; super.buildEnv {
      ignoreCollisions = true;
      name = "latex";
      paths = [
        mytexlive
        gentium-book-basic
        pythonPackages.pygments
      ];
    };
}