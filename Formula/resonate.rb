class Resonate < Formula
  version '0.7.21'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "71d719fcd2f8f391ab05f5ddeec33dd7f2ed8e83de713752e9026d2622e5d034"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "b8b3aa4b4597c393051609148a61ecd54e7f21568cf5becb7c85808ce833957f"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "bb4c798fd06fe70d3d8ea161984fede4822fcb822e0d2c8d36084fa47e724a18"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "9fb550c919b107312ee579f7d62cd1d5d04da5c944b7d0719abe97876040d44b"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end