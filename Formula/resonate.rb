class Resonate < Formula
  version '0.7.11'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "bdc2faf90bb04bf38f113fb773f1fafbba042c290d01f688f5c39b1df21bb07c"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "bd6fb98d1235d23e0570b5f30b7ef1c053ff1e98b423fa75f8178b25bae78b0e"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "37084e2ae938711a2e65167483436a9d27913d1fd471d82704cedef276e60b66"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "386cb1087ab4f449b31368102bfdbb8d7a4a0dd6de6514b10bd5822150850796"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end