class Resonate < Formula
  version 'v0.9.0'
  desc "A dead simple programming model for the cloud"
  homepage "https://github.com/resonatehq/resonate"
  arch = Hardware::CPU.arch.to_s
  if OS.mac?
      if Hardware::CPU.arm?
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_aarch64.tar.gz"
          sha256 "166a70812eaefdb16de80c0c7449761ba17eabee40e51485c9f7159e585d33c0"
      else
          url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_darwin_x86_64.tar.gz"
          sha256 "fcb90a12a1a8672af74bd2630841d1f1041817504101b5dad3499a284766b424"
      end
  elsif OS.linux?
     if Hardware::CPU.arm?
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_aarch64.tar.gz"
         sha256 "e60d8f34ee2cbca961bb6f61c0fe97bcd64566c04e0c7a50051729778476298f"
     else
         url "https://github.com/resonatehq/resonate/releases/download/v#{version}/resonate_linux_x86_64.tar.gz"
         sha256 "c958a262a66fc13ec44584e8e88e1d4a9ebc779b629fe46fd95217aee98c6a57"
     end
  end

  def install
    bin.install "resonate"
  end

  test do
    shell_output("resonate -h")
  end
end