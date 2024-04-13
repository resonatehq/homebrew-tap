class Resonate < Formula
  version '0.5.0'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "6b555d3968d8b182bc4943146253d32405bffb5640925ee55434887cc85c4a4b"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "1c87383523da525183a65bab523bf03c442d8c0873ed15feb4ac7d6b0633b3b5"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "7cdd3a0e760561a39253eab6c6095d81024cd577ab3e72380a8810d7b9d0faa7"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "3de9916ef287220e5f71d6c2e4a9859bbb243066e56fbf0ad68c41c93db2e6ca"
     end
  end

  def install
    bin.install Dir["*/resonate"]
  end

  test do
    shell_output("resonate -h")
  end
end