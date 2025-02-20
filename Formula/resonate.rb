class Resonate < Formula
  version '0.7.6'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "e6ab31a24bfa0bbe2d7268e4e964aba9ca228f9a4bfe7e000eb62010e5705664"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "af2033146f901839354daaba4e9f4df7136fedc0d8e14e0682193d1fae3e8801"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "77bc11c83583be16512f332a225db2bf26ea5842698b39ddf2f34aed16970ae5"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "142f333936470b4b92450728db1f10c10c22097cc817098b9fe144ac9347fd30"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end