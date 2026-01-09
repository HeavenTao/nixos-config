{pkgs, ...}:
pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "iflow";
  version = "0.3.15";

  src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/@qwen-code/qwen-code/-/qwen-code-0.6.1.tgz";
    hash = "sha512-Ge2Dq3PmXIHhIN0WNIyAem4H2czSXJlrsb0j6HwDG8hIl9oBr2yZS2yAYAbQF2KvkeT7kHeZ8i4/9moxTOKz4w==";
  };

  buildInputs = [
    pkgs.nodejs_24
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp ./* $out -r
    cp ./bundle/qwen.js $out/bin/qwen
  '';
})
