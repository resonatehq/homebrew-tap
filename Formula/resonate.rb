class Resonate < Formula
  version '0.7.15'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "1c871f47be5370cb67ec0a58777af25a1a0ac7bdd10a7598bc39d9fd558c4a65"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "f47eabcdefb3ac219ef28cea26135a1058db8d28e22e2bdde439d3609b9e47cb"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "bed4a98154cdc1c13a43b195e68c61f9d7eaf7a7ac4fee1b0a4069e421c25dd1"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "68b486429d51500d15bd122ad95dfe3e4e400ae70bb17e7df3777ac2166eff3a"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end