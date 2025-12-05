class Resonate < Formula
  version '0.8.0'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "27376f735e9af4ef9394bdb9159f5ec04e0a2d3547ff42d4d23d04fd678b6e91"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "232b5768baa2ce699a9eaf518b0c049e34a5b21b58ba44bc3d4c91250a9d2b6b"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "221a32d9c3520feee092b3228875e98e028eea24e5fdfc9017e498717caa4e9e"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "c73bcd00c1dd097f569fe6c37332d4fed509df0aad2370e14bff79865d6d2c0c"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end