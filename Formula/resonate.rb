class Resonate < Formula
  version '0.7.14'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "ba20fb673a86dd575ad0d75069482e83d7858457db500e1b20f70ef06e8b428b"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "9fd4ba1c3fafac02356b7f0eda62b6224489c4f66602f657b4aa9260b89571c8"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "7c11d506918ab7e3dcb1c9f9845b1fc3250c2b7ecaac2ccede3dd8ad1e8d8e6e"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "d353f57c70f7a0738ac5e84ec51f490ebd11a7572008796639fe0f3e91c5ab7e"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end