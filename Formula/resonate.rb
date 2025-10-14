class Resonate < Formula
  version '0.7.18'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "b4f288e24890332d0f7fb40607cbe42f6ce1723be70f802882efc7350fc61eeb"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "1a4b67d0439078caa293896a96338ededbcb1a53ed8da3a3a00bcd701c9c6811"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "68dd3ea2aa3491c73e373d97f10d7805b61a5c2ff6f14e1b8b83e48f1597f953"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "89ecf99da4255b3470dcde254b4dcfc0f17d9b7b75d3c4f61e1a63f562bd6d97"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end