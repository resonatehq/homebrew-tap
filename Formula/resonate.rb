class Resonate < Formula
  version '0.7.19'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "ecd6b105123f605b98ca07a368bd0bbbf7cb7aa641b7e260dfd52f3d9fd681be"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "f03bfd303157e2a42c419ace965fdccec6fd0108582f3870b0dd6774557c993e"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "5d136bfe6c3a95cffd8ba37058b7882211b6730a57d2341cae00b41291044b57"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "2742383b8df1959ca4c1f537588ae10425b2edc8ba9319fa23f64aa1456afd27"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end