{pkgs, ...}:
pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "iflow";
  version = "0.3.15";

  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/@iflow-ai/iflow-cli/-/iflow-cli-0.3.15.tgz";
    hash = "sha256-FoJg7/rXfkkpj5M4YbvdN5lMJwfW6hHmxR9NMLfSqBo=";
  };

  buildInputs = [
    pkgs.nodejs_22
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp ./* $out -r
    cp ./bundle/iflow.js $out/bin/iflow
  '';
})
