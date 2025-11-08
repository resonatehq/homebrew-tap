class Resonate < Formula
  version '0.7.22'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "87946280a6784e5611975938cfb06cd34e33d85576e20e9fb6b0f0500933e3a9"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "7f794efd2d746594947164e276e4f4f0dc758a0f6a8b0f5d99795665e80ae7d2"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "0cd18a1e19c80b37244cdff52b03097c4e08404ff09504464b05315eed534a1a"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "63ae9762d3ea5504060f8b5dc2e795922c6b952e03cc0faab9102471cf39c471"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end