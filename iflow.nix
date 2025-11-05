{pkgs, ...}:
pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "iflow";
  version = "0.3.14";

  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/@iflow-ai/iflow-cli/-/iflow-cli-0.3.14.tgz";
    hash = "sha256-GXfVJmzM8AFTYC7SBieng8pA9HgD33/H+xwJNmQ8waw=";
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
