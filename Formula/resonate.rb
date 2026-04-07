class Resonate < Formula
  version 'v0.9.0'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "f38b9663c6f5933cf16e74d9488e13c5b5fad5478cfb30ee1aed9f2e24495e90"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "b6d57b6cf40e8dc10ee1b873cf7ea49ef27e996aa455bec9ef08808e5714c9f3"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "b091681b24202fd366ad81fbebc13f56a7adb067f29b6f429f0b3b3f09407dc3"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "a98fddccf664630ccd914e8e6c4bf0c8822d0836860c82a8175bb99de66a8947"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end