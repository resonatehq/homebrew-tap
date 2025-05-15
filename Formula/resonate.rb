class Resonate < Formula
  version '0.7.8'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "8fbe6d222c68833131ff3601f9d3d11204c2df11607173afb6155926c6d1100b"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "7e97eb5d0b3ab18e8494da82824a2b9d247cac3e977beaf6c5de2acf688473e3"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "66c19aa43b51c79a461b258fead30ef0b20f1ca76bd6d165c6b3863e496398c8"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "4229e1addac50223791b6379f22dd2120eed254208059bda3876ff7f94006aaa"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end