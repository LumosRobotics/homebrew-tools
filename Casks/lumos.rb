cask "lumos" do
  version "1.0.0"
  sha256 "df78b50274605adc444710f6f356adc4e789868540e955785352cfd6c4712681"

  url "https://github.com/LumosRobotics/LumosTool/releases/download/v1.0.0/lumos-macos-1.0.0.tar.gz"
  name "Lumos"
  desc "Lumos Robotics CLI tooling"
  homepage "https://github.com/LumosRobotics/LumosTool"

  # Where the binary lives inside the extracted archive
  binary "bin/lumos"
end
