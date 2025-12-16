class Resonate < Formula
  version '0.8.1'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "390d655fed1c2ff4bf27835db5b3455d18a446fabc9baf271e9aaa0675b28385"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "ce96036e59affad39297d3ac374be146095371ac48a459b65500514122bbda2f"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "51b19209e37ab175fc7e10aae1b8cb0c12d7d3361ca820736b21f6a9533b2925"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "fb2c0c031f693b214f6b1e61f81d4651dd77edad9783f73e37df8d5a1fc9a0b7"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end