class Resonate < Formula
  version '0.9.5'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "1b573a8388e7e16fa88437f989667af317e94b1b70404ebc971bb49afe0b74ad"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "879f3409257b8c26a74237edf8d8c5cf7d9468246e7bce584438bf2921f31704"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "257e3e6040157288894fc47381c0f5a3016d44ca20e6ded8f8b354b5fcc7add9"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "7760ea0baa163324e348ed6c94cf867e4f67e6469d1b5982c000eed8040fc4e2"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end