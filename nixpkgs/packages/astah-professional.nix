{ stdenv, fetchurl, makeWrapper, makeDesktopItem, unzip, jre }:

let

  name = "astah-professional";
  version = "7.2.0";
  postfix = "1ff236";
  desktopIcon = fetchurl {
    name = "${name}.png";
    url = "https://aur.archlinux.org/cgit/aur.git/plain/astah-professional.png?h=astah-professional";
    sha256 = "1ajy3vbn2ykxs65jk4h585kcxjy3p1m16026vfz8rfk0z6720i4q";
  };
  mimeXml = fetchurl {
    name = "${name}.xml";
    url = "https://aur.archlinux.org/cgit/aur.git/plain/astah-professional.xml?h=astah-professional";
    sha256 = "180rhm0n62h6v240iqi9lqd480rr970ia620zjd1bnragfgn6s15";
  };
  desktopItem = makeDesktopItem {
    name = name;
    exec = "astah %U";
    icon = "${desktopIcon}";
    comment = "Lightweight, easy-to-use, UML2.x modeler";
    desktopName = "Astah* Professional";
    genericName = "Astah* Professional";
    mimeType = "application/x-astah";
    categories = "Application;Development;";
    extraEntries = "NoDisplay=false";
  };

in

stdenv.mkDerivation {
  name = "${name}-${version}";

  src = fetchurl {
    url = "http://cdn.change-vision.com/files/${name}-${stdenv.lib.replaceStrings ["."] ["_"] version}-${postfix}.zip";
    sha256 = "1s4yhpcvxb079dg7dnm3y7fpxa7ach9vysv80zxifmkdlmkrvgf3";
  };

  nativeBuildInputs = [ unzip makeWrapper ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,share}
    cp -r . $out/share/astah
    cp -r ${desktopItem}/share/applications $out/share/applications

    install -D ${desktopIcon} $out/share/pixmaps/${name}.png
    install -D ${mimeXml} $out/share/mime/packages/${name}.xml

    makeWrapper ${jre}/bin/java $out/bin/astah \
      --add-flags "-jar $out/share/astah/astah-pro.jar"

    runHook postInstall
  '';

  meta = with stdenv.lib; {
    description = "Lightweight, easy-to-use UML2.x modeler";
    homepage = http://astah.net/editions/professional;
    license = licenses.unfree;
  };
}
