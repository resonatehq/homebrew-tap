class Resonate < Formula
  version '0.7.24'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "707e03b87e3bbdaf9b859564b4db3f331ed773e365e3b7f1531cca755f30db2f"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "13a763ffca61cb49511d89352f99ae451fc5d9d91aab8c212451ed59de1c430d"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "1d2d122877c55274751f953ef87d1600bb33e87ab4a0736c44200aedca7663cf"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "cded03b585139bbc1d8b2fc3879ef05b5a30a9bc8f9488c18d368cf1423d24a7"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end