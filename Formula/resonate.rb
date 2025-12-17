class Resonate < Formula
  version '0.8.2'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "2e05108e4150da570ec61ffad9969f6fe70f2542411a0d0957f2fd4a1710e6d4"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "9946d301aa579cbb699f999fdf7662ed747afd060d9409112d764af4e54fc5f3"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "a6a1e2392f3212ffd60775d45c0ec14d45e003d39f090e06ff75e1a46916fbd3"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "38e77b7c9513b8e19e7f50fe9940d735afd462c36e664099161eb58746ca4eb2"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end