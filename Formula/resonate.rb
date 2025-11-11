class Resonate < Formula
  version '0.7.23'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "40841df3d49383c3af44f641f053c5b557c9c68845b463d5c7bb25e3d9fdffe6"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "53ca135d3acb5d8983d75f6ebf2d30ff109ae79cbf2ea92967d4fcb11485b494"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "5c1b4e159bf48318851dc6d68daf35587a84b84bca4cc74c02d4ca3fd172f677"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "4f975397496c19a345f8963df7391cff2b379cbfd860990c3076c5bfffacb78a"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end