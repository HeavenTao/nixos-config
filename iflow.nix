{pkgs, ...}:
pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "iflow";
  version = "0.3.13";

  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/@iflow-ai/iflow-cli/-/iflow-cli-0.3.13.tgz";
    hash = "sha256-fdtqbjBN9q0wZGKnt2v8wGTpcV/HAUdUQ94qmp57YuQ=";
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
