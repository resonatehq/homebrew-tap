class Resonate < Formula
  version '0.9.6'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "c7d8c579a59e5b05e113c281eb790ae45ac3dd094993c62a5fbb414e05e93c90"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "8b8206ccdb4c4ac42d5b25d822028b864791906b6823ec30eaefcc9d3f6acba6"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "4c7e11364ebab6300462441dad734587616df814dbc1f59d364052d18a7ae6aa"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "0c4aa1761fdd35255b5c5057db1e9091ea18a51d5a680156f7178db25d560088"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end