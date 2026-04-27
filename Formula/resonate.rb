class Resonate < Formula
  version '0.9.4'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "076c4e79240303f388e77b29d5fd51d7de5690cb39507c942a5da7099460666d"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "e017281e072d0b2fec80f06aa439881644a878b155584873234ff5bc840d2a56"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "deb811e7e3ec09904bf2d6a72adedf22722e0dadf1e37d324b59ebfef9102ef2"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "88f3a41c21181e3b3eeea168e927ca069960fe4dfcc7ce441410af27a0340722"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end