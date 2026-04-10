class Resonate < Formula
  version '0.9.3'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "bf5caa49f283e807e6830c01960408758b2f1425534a69966c3630c882706ce0"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "65d7d92aac6493b969d31e72c1d31d2d7280305cfda780ecb5d5fe7a85164898"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "a3b11ed5d5c4acf89f5845d3b5b63c5555b98b65c02463d3c88419e169eed40a"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "b59adcca111115fe04436adf3c9db53d16a8a5a42339835b30048e36edbb31f2"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end