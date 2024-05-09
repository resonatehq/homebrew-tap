class Resonate < Formula
  version '0.5.2'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "c1147ae969b6fa8a73beaf74805d1be638a566e7ce08aa5ed5ba2e820fe169b0"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "4db07e767f4d1eba903052fa47dac163f8ecafafe84f633d730debb9d5d13ea3"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "89fb298a8ee6537ef3c64eb83429fa98b5c04dcdcbcd467f88bad3b5e672ab4b"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "9b11ea993168dec3a94b16527c130b0050dca578df6b5fac5c7281064d78b7ba"
     end
  end

  def install
    bin.install Dir["resonate"]
  end

  test do
    shell_output("resonate -h")
  end
end