class Resonate < Formula
  version '0.5.5'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "e55db38e9f619d3997ec850efe192d881900a9e0747990dfca2ead06a9e262b4"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "a3295f8e3d0d13d4bbdf9d7eb39a873056b8e5895dc8cb05cdf00fc55ada758a"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "38d6911623ca85dcda0897e8e2f8c447fcfc6d8e4abd49f7cfcf5a957876d56f"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "0344e36de9b2175f36e64d5d734eb7bdba6c950fde2c5c9ce201a783aeffd582"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end