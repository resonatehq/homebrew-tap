class Resonate < Formula
  version '0.5.3'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "bd220ccd72680d2b1752070f9f4f450539ba23105f0627a35727200b7e73c004"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "0a623818adead35bb5a9484bf4f56593bee672c8057379e25340d9eeac2b0851"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "3adf96f7052487c8a1a45f84f1f528d2d7c371b9a6c993824bbea691ac22d21e"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "5cb38fb393633792c4328929074d36717351ee5f8b1d0fdf0747d68f92dbd0f6"
     end
  end

  def install
    bin.install Dir["resonate"]
  end

  test do
    shell_output("resonate -h")
  end
end