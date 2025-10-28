{pkgs, ...}:
pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "iflow";
  version = "0.3.9";

  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/@iflow-ai/iflow-cli/-/iflow-cli-0.3.10.tgz";
    hash = "sha256-mEVC4Wpk95imfww/n/W0OtEbS97c/8CDomW3a5k3dZQ=";
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
