class Resonate < Formula
  version '0.10.0'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "0a5bd2639b54922083505d6babd3c0833bc6d3676d08915a96a8392a3027280f"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "40906605cc907185c2f421cde25550c21ed57fa9b21e73fe069de1cdcb43204b"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "ccea58645905e22725b0e81827e4ee953dc946f898489d3ca177366e3a289eb1"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "5d45bbd7bf92cce1f97817043df50b86c60fe874c45c071a7b6fc525cd1ef77d"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end