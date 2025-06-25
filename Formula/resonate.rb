class Resonate < Formula
  version '0.7.9'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "828b5773041e906f45edc8d0f433875364147d8f30533225562256e28a6b0cb6"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "f5ed4e110931216123da77518ca4e5ef7321ae453b5d66fa3c90ed5fb8ffa4a3"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "32def04bf03ffc456a897d10e4e01e91ccdb5ca29f1a7a7a728d7e917f1b903e"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "29e936e4f24425a62a5bef8e9792b371522b41afe9295f9c50b00caf29d611a1"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end