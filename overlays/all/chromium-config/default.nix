{ stdenv }:

stdenv.mkDerivation rec {
  name = "chromium-config";

  src = ./.;

  phases = [ "installPhase" ];

  installPhase = ''
    for profile in anya ihab nosecurity personal publica vanya; do
      install -dm755 $out/userHome/.config/chromium/profiles/$profile
      touch $out/userHome/.config/chromium/profiles/$profile/.keep
    done

    install -Dm644 $src/cmdline_args $out/userHome/.config/chromium/profiles/nosecurity/.cmdline_args
  '';
}
