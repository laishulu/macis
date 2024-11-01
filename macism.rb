class Macism < Formula
  desc "MacOS Input Source Manager"
  homepage "https://github.com/laishulu/macism"
  version "1.4.4"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/laishulu/macism/releases/download/v#{version}/macism-arm64"
      sha256 "cbf462686551de911c3278d4d299a62c0e61230bd7b1897a4e7f1d49d951f9a1"
    else
      url "https://github.com/laishulu/macism/releases/download/v#{version}/macism-x86_64"
      sha256 "21ca3d27cb20472f72e99e66f87e9e771ec0a13663b4900aeccda40380aec834"
    end
  end

  def install
    bin.install "macism-arm64" => "macism" if OS.mac? && Hardware::CPU.arm?
    bin.install "macism-x86_64" => "macism" if OS.mac? && !Hardware::CPU.arm?
  end

  test do
    system "#{bin}/macism"
  end
end
