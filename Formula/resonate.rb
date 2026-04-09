class Resonate < Formula
  version '0.9.2'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "b9ac1d904d0f82919abbfd78e7470b140ddfa5db087b65b298f1e70f405692fc"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "f83f78b2efec48671eb4fa9733da48aea8ae41d939ffe752ecc6f3f7b315ce1c"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "0fbc07233c1d7f366cc14331044d279cb3718cbc364f0a7d3b4f2132c6cb38ef"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "28df81b444cd51313b574ebdfa96a9ebfb8331ace7af38599ace72ad4c1a16c1"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end