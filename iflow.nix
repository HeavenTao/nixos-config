{pkgs, ...}:
pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "iflow";
  version = "0.3.11";

  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/@iflow-ai/iflow-cli/-/iflow-cli-0.3.11.tgz";
    hash = "sha256-H9SqYh3jN064hdbhQWauuBqqfRyiP2X9YYDPc8qDr7s=";
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
