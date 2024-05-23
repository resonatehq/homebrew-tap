class Resonate < Formula
  version '0.5.6'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "6414a50ea8da37fae3b6cfcb0ad8fc8f08aa3d3f4b0993403ab11f2b0b0102d0"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "2e849678508e2c1f853b0a0065d65d60da8e69ef551ef655159b884e8c69d3c7"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "6112997409baad64ff599c02b9b7e0b96aaa56a0707f93a023b6f011b84a662a"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "e02cb4acb19e6f1b0ce6ebc2872a38549f49a7750bbc5cc0d839e7842abca1f2"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end