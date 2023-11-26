{ stdenv, fetchurl, lib }:

# 这是一个示例：解释了如何下载一个二进制文件并安装到 $out/bin 目录下
# 安装指定版本的软件
stdenv.mkDerivation rec {
  pname = "k9s";
  version = "0.27.4";

  src = fetchurl {
    url = "https://github.com/derailed/k9s/releases/download/v${version}/k9s_Linux_amd64.tar.gz";
    sha256 = "sha256-5QeDHr1fm4wDgPISZp81LG40y3YMkWtJi6uui+g8Q5I=";
  };

  setSourceRoot = "sourceRoot=$(mktemp -d)";
  sourceRoot = ".";

  phases = [ "unpackPhase" "installPhase" ];

  unpackPhase = ''
    tar -xvf $src -C $sourceRoot
    ls -al $sourceRoot
  '';

  installPhase = ''
    ls -la $sourceRoot
    mkdir -p $out/bin
    cp -a k9s $out/bin/
  '';

  meta = with lib; {
    description = "Kubernetes CLI To Manage Your Clusters In Style!";
    homepage = "https://github.com/derailed/k9s";
    license = licenses.asl20;
    platforms = platforms.linux;
  };
}
