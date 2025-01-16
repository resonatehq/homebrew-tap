class Resonate < Formula
  version '0.7.2'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "9d9381c71954ebe0bd1d6bb47765af8ab13a1296136260b9139a05385f47ef50"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "07a35b16a2e2196b36275a28369d7ad20c878a35998e26448f734f34c73e0333"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "6b5eb5617507ff86d6ee518d667f757525b3108b92109b21b7f7f45e7cd4effb"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "760b0a4085cb5fd8922acb3bc7f7d3969f373e3aa47363bd1b6365c225501e86"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end
