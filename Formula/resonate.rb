class Resonate < Formula
  version '0.6.0'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "13241be8945289fc85c8f0ece90da2425ec49a560f38d54575f50ca53a92eda6"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "b4773d6b9ed25e45e03c431d0cfc14daeb9852d3fcbb3e78ed788fcfe7b56ff4"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "2f7341a976635ec7abfebc23129687528417ce74aeecc7d287a15c9441de5c16"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "da15e29d3a04ab72c3369cadbe199e2348945ce3b6d2afc9a370ea517c0868cc"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end