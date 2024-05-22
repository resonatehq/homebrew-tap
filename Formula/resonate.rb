class Resonate < Formula
  version '0.5.4'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  license "Apache-2.0"

  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "b9dd81687fad005d7050a0e624c880161b353757e35d9a4ace33a73223a9a5e8"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "010a7284697db42fdbae718203c22694d91de7eb2af715a9afb077c25be1e6fe"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "acf0f40e6fb277287800ad5190b5b7b45a14cf56025aeac17543de61f5286115"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "7bce4e3193d806e7f695a2f3065378379b787cd2dc6826da7fec1ccc4f36e08f"
     end
  end

  def install
    bin.install Dir["resonate"]
  end

  test do
    shell_output("resonate -h")
  end
end