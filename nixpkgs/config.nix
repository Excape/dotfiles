{
  allowUnfree = true;

  packageOverrides = pkgs: rec {

    ### --- package overrides ---
    polybar = pkgs.polybar.override { i3GapsSupport = true; };

    nextcloud-client = pkgs.nextcloud-client.override {
      withGnomeKeyring = true;
      libgnome_keyring = pkgs.gnome3.libgnome_keyring;
    };

    xfce.thunar = pkgs.xfce.thunar.override {
      thunarPlugins = with pkgs.xfce; [
        tumbler # generate thumbnails  
      ];
    };

    myVscode = with pkgs; vscode-with-extensions.override {

      # When the extension is already available in the default extensions set.
      vscodeExtensions = with vscode-extensions; [
        bbenoist.Nix
        ms-python.python
      ]   

      # Concise version from the vscode market place when not available in the default set.
      ++ vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-theme-onelight";
          publisher = "akamud";
          version = "2.1.0";
          sha256 = "1dx08r35bxvmas1ai02v9r25hxadmvm1fh50grq2r4fzqxjgxkqn";
        }

        {
          name = "latex-workshop";
          publisher = "James-Yu";
          version = "3.11.0";
          sha256 = "1h9fk8v2l457vxfffhv9p3bvg5rfh7ij301fbg40y1ffp9907g25";
        }

        {
          name = "code-spell-checker";
          publisher = "streetsidesoftware";
          version = "1.6.2";
          sha256 = "1lydxzms6f6g3msfmk2xrnr2yvf3av3ydq2n888wrnds3lkrrs56";
        }

        {
          name = "code-spell-checker-german";
          publisher = "streetsidesoftware";
          version = "0.1.2";
          sha256 = "02nkzd85i7kl6gldwq29gld82xrpcp5bzgmccymn4yiwgznancdq";
        }

        {
          name = "material-icon-theme";
          publisher = "PKief";
          version = "3.2.0";
          sha256 = "0gjivsfra1m1a4kdgpx795g9mp6h968r38kp6cj5h9mxnqn65zrf";
        }

        {
          name = "markdown-all-in-one";
          publisher = "yzhang";
          version = "0.11.2";
          sha256 = "1j4v89pnadf3q38nx3zknsyprallwh767v2b3y5gsfz87ar5b76s";
        }
      ];
    };


    ### --- custom packages ---

    openhsrConnect = pkgs.callPackage ./packages/openhsr-connect.nix {
      inherit pkgs;
      pythonPackages = pkgs.python36Packages;
    };

    # mkdocs
    mkdocs = with pkgs; callPackage ./packages/mkdocs.nix {
      python = python36;
      inherit fetchFromGitHub fetchurl mkdocs-material pymdown-extensions;
    };

    pymdown-extensions = with pkgs; callPackage ./packages/pymdown-extensions.nix {
      python = python36;
      inherit fetchurl;
    };

    mkdocs-material = with pkgs; callPackage ./packages/mkdocs-material.nix {
      python = python36;
      inherit fetchurl fetchFromGitHub pymdown-extensions;
    };


    ### --- package environments ---

    terminal = with pkgs; buildEnv {
      name = "terminal";
      paths = [ termite autojump ];
    };

    windowManagerTools = with pkgs; buildEnv {
      name = "windowManagerTools";
      paths = [
        feh
        shutter
        polybar
        i3lock-fancy
      ];
    };

    desktopApps = with pkgs; buildEnv {
      name = "desktopApps";
      paths = [ 
        firefox
        keepassx-community
        thunderbird
        libreoffice
        xfce.thunar
        nextcloud-client
        sxiv # image viewer
        zathura # pdf viewer
        gimp
        qgis
      ];
    };

    devApps = with pkgs; buildEnv {
      name = "devApps";
      paths = [ 
        jetbrains.pycharm-professional
        myVscode
      ];
    };

    pythonTools = with pkgs; with python36Packages; buildEnv {
      name = "pythonTools";
      paths = [ 
        virtualenv
        mkdocs
        mkdocs-material
      ];
    };

    # custom latex environment
    mytexlive = with pkgs; texlive.combine {
      inherit (texlive) scheme-small collection-langgerman
      IEEEtran
      collection-fontsrecommended
      collection-latex
      collection-latexextra
      tracklang;
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
