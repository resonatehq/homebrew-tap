class Resonate < Formula
  version '0.7.12'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "d54b5edc245b9a09e7554e5b7d000fc039a3bf0ca0bf4dc8a9b094c5c29c650a"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "9c3cbe1c052437310051f1284164ace0cf245d8b66fadbf3294e881f8e8f2bf5"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "26bf9e45a719d88cf2275a2f16f7d5b5884dead4e83aa4a30ed712b0739665ea"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "ec6efb6ead6023a177a1847007b2b93bd25572d0680a3a76c8ec20fe9ab8ec5c"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end