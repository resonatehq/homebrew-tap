class Resonate < Formula
  version '0.7.17'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "e1c7a04b45056513578d2635731798b90e4d719daf0389556c5894c4067d1c23"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "2b2bd5205d57364462cfb2f666a79893e6f5f2ab7fe324829b98981e9181b605"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "55f3b0bcc080e194ed989af185a6a707c36ba53ea063574493933eb2b2623fa1"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "19b4550e358dcbf4e249e6e572dde545b218d76b0ce72b84a526427965e9ba34"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end