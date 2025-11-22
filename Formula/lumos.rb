class Lumos < Formula
  desc "Lumos command-line tool"
  homepage "https://github.com/LumosRobotics/LumosTool"
  version "1.0.0"

  url "https://github.com/LumosRobotics/LumosTool/releases/download/v1.0.0/lumos-macos-1.0.0.tar.gz"
  sha256 "df78b50274605adc444710f6f356adc4e789868540e955785352cfd6c4712681"
  license "MIT"

  # This tells Homebrew not to treat it as source needing a build
  bottle :unneeded

  def install
    # Install CLI entrypoint
    bin.install "bin/lumos"

    # Install to share/lumos so the binary can find it via relative path
    # The lumos binary expects: {parent_of_bin}/share/lumos/src/toolchains/...
    (share/"lumos").install Dir["share/lumos/*"]
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/lumos --version")
  end
end
