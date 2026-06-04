class Resonate < Formula
  version '0.9.8'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "cf6bbf0870955aef10679684ec533e71d9c478e59f0068e3b1ba1222661d9177"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "1f9f671512edf3b7b9aaac62140d616c5e4419dda8d2931381df2832b0314bc6"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "f9a701a33af0371674e7b9cd6534f13f9bcd7b363ed6e65322c9952f65ea3bc4"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "67caa5d5fe0ae7219e2436e8f2d232b7bcc49814649e6a1c29e6545f4c45bca3"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end