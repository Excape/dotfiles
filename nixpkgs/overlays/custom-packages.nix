self: super:
{
    openhsrConnect = super.callPackage ../packages/openhsr-connect.nix {
      pythonPackages = self.python36Packages;
    };

    mkdocs = super.callPackage ../packages/mkdocs.nix {
      python = self.python36;
    };

    pymdown-extensions = super.callPackage ../packages/pymdown-extensions.nix {
      python = self.python36;
    };

    mkdocs-material = super.callPackage ../packages/mkdocs-material.nix {
      python = self.python36;
    };

    osmium = super.callPackage ../packages/osmium.nix {
      python = self.python36;
    };

    eclipse-ee-47 = super.callPackage ../packages/eclipse47.nix {};

    astah-professional = super.callPackage ../packages/astah-professional.nix {};

    records = super.callPackage ../packages/records.nix {
      python = self.python36;
    };
}