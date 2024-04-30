class Resonate < Formula
  version '0.5.1'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "424ed72d5de6f8b2275fc1c6a3175939a3367711dd677172a208e266e9524d8f"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "ce37413513db2dc271a32deb0a1442b053c6a2de51af6c7dfe9b701effebed2b"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "97c0b0b2eade6b99c06589275e00b2dc0f3b11f91a7684dfce3dfd85c62b8cba"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "2af0aab437f3e9ec363ab59a072ccd1ecbb909f2a234083dcee863978ebd75fa"
     end
  end

  def install
    bin.install Dir["resonate"]
  end

  test do
    shell_output("resonate -h")
  end
end