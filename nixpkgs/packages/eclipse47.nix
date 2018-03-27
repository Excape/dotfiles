{eclipses, fetchurl}:

eclipses.buildEclipse {
  name = "eclipse-ee-4.7";
  description = "Eclipse EE IDE";
  sources = {
    "x86_64-linux" = fetchurl {
      url = https://www.eclipse.org/downloads/download.php?r=1&nf=1&file=/technology/epp/downloads/release/oxygen/R/eclipse-jee-oxygen-R-linux-gtk-x86_64.tar.gz;
      sha256 = "1w5l1sxqzb6w2akd8bl74qsm5a3bkrhb55fvfa9mlrdbdr5cj7vj";
      name = "eclipse-jee-oxygen-R-linux-gtk-x86_64.tar.gz";
    };
  };
}