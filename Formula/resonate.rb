class Resonate < Formula
  version '0.7.16'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "041c19aa4895f8949bce3401daf101b6a21d164e07cba0565c2e96d58fb8d2cb"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "e7416381275c193e311e6c885154ba3a026e02bbc67c34dbcd1806e164757219"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "31d4adf67a2e194c5daab384a66d088068db96457ab08381b8af06ab1875dfa3"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "a5cc87714b7879a52b4c5341f8a326dad084b58bae97d4281b79825ae2f07941"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end