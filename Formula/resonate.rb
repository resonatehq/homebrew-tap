class Resonate < Formula
  version '0.9.7'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "bd314ecdc496025648dd84d6f520f647f0c76e7573e79dfe83e1a77ed70f490c"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "827e6856f9bbff612052794de1235c29a59a4384de6d2d44e13b99228ef9560b"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "62f349ad5a7065342e541bbb85a598653413300f5b811eacc0e9b0fc2331d6f3"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "f004581d865ca6da6bed0853eade9c8b1be64feaf79514463dffa454eb74f6c9"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end