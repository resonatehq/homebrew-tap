class Resonate < Formula
  version '0.7.10'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "efeab71695341b36756220f2531500a23f6b49a8efac60ef1b7afbac7d792217"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "b297e9c7e0239d169305b318fa89d3603459ce94a790a2228aeb6de56d4f74f0"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "52bedaceb6bbc136a830863685a7b6cf3db68d444344ed7810904815c7ddeda6"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "c2a253f029ed32d01c59ef665b52153b13ab7baa36f1e23a89ca479856eabc83"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end