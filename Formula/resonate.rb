class Resonate < Formula
  version '0.10.1'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "2c460fe7dee050e3cbc9c719cff6dccfaf3253b8a5155b0258762c5e0599dc77"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "c82e5917cfb4c892bc371262a20005cd28c7c81117dad5d75a40f0babc30ad3c"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "e0e5cceb52e018a080dfe4882c96a5f2240f9185c583eed3968b5ddc7140f8a2"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "fe4be41412e1d5eebf3bc8f427684cf36e9873ab2dd809e3a4da8100bee5a4ea"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end