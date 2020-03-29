{ stdenv, curl, postgresql }:

stdenv.mkDerivation rec {
  pname = "pgsql_http";
  version = "v1.3.1";

  buildInputs = [ curl postgresql ];

 src = fetchTarball {
    url = "https://github.com/pramsey/pgsql-http/tarball/4a14f704d2835e4e741fcee74436fc52d8ba4e34";
    sha256 = "0nb0prnhsjsgl5053ai5xyapmiy62zknjcipzgx4wmqrblcyvnzi";
  };

  installPhase = ''
    mkdir -p $out/{lib,share/extension}

    cp *.so      $out/lib
    cp *.sql     $out/share/extension
    cp *.control $out/share/extension
  '';

  meta = with stdenv.lib; {
    description = "Temporal Tables PostgreSQL Extension ";
    homepage    = https://github.com/pramsey/pgsql-http;
    maintainers = with maintainers; [ ggpeti ];
    platforms   = postgresql.meta.platforms;
    license     = licenses.mit;
  };
}
