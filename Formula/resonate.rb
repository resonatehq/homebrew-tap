class Resonate < Formula
  version '0.7.0'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "06f6354d8614bd94e41d8e334ca525de168f88d837360f985abf56886332be3d"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "ad822085f7537cfd2c7e4bcf040f0216410166b1df6cc1ea6e6c4f87548f6dcd"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "0b1be0566c1bc8520bcb2564360ce0757696421624f5ebf86a9ff0aba893b374"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "10126415d51bbc93b0f3c4320cb06c335662e957dc455a233dcb650b9ff818e0"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end