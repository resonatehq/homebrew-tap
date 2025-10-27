class Resonate < Formula
  version '0.7.20'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "6bcaaae6e9a0ba65cdfe319e2722977984b964757c8acbca856a2de158380e4c"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "2382e695f5c287afef19e9d43c464c3c809de4292e3407a2629fd6e6b742c085"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "50509b4880b9d2a9941e4e29027f93de746a05f62ae065a268c34e59324b56bd"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "e046ab973c2dd571868cf8d700fb4d0e973519f4f9a2d779b34116bf962ad2c4"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end