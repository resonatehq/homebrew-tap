class Resonate < Formula
  version '0.9.0'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "a7f37ad8e5da6cdab86f18b1fd2f958ddc180f6db8d2de896cb042553f706922"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "5fdaf14eb125012368da79d43696046a0d93327b69655e906c2c0fbb8100748f"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "d59cddd5077f9d04484778fb4c5f2de2d50d42052c27bcb1da5da1d2eb25f043"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "27ca398bd922ea20329d3310d44e4c8cab1221674623f8d67b3527ff5ad68dfb"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end