class Resonate < Formula
  version '0.7.13'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "39657715fb33ac482159a29189b8f6ef5f15767005af45d676a4d50fd7328ea9"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "d46102ff2f5f1a9267935e8c00535e3dd23ef58715549785c9833755a441bcd7"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "f852538d3c54f74ffb0c31cd1544b140c07c051b93ebd1b4a23d4b0ffa4ada11"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "2bbeac996162abecc843f7947473de2a49eb1b3f9125182ae74790758628b676"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end