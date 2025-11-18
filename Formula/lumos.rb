class Lumos < Formula
  desc "Lumos command-line tool"
  homepage "https://github.com/LumosRobotics/LumosTool"
  url "https://github.com/LumosRobotics/LumosTool/releases/download/v1.0.0/lumos-macos-1.0.0.tar.gz"
  sha256 "df78b50274605adc444710f6f356adc4e789868540e955785352cfd6c4712681"
  license "MIT"

  def install
    # If it contains multiple files or folders, specify the correct path(s).
    # Example:
    bin.install "bin/lumos"

    share.install Dir["share/*"]
  end

  test do
    # Check that it at least runs and prints a version or help
    output = shell_output("#{bin}/lumos --version")
    assert_match "1.0.0", output
  end
end
