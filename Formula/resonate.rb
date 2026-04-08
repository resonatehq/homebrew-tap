class Resonate < Formula
  version '0.9.1'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "600fbdb5a693c676d4b1d6b6ea9a46c6ef692d56f9d962bf18a832721cc2bf1f"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "1e50a281e85b8a36d6c648e2aa32267c2da9890a94757b6280671efc9cd4397c"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "2c8a328f42b20d0634906f1b3f8d0b0cc9bd17c838645cea7fc3bed9e6e89c6f"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "4eb0defd4eeeaf211075e073cff37f0269863c68d11cc2cada55ee62b048abb1"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end