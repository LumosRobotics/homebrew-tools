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

    # Install everything else into libexec to avoid polluting /usr/local
    libexec.install Dir["share"]

    # Optional: create wrapper scripts for ARM toolchains
    toolchain_path = "#{libexec}/share/lumos/src/toolchains/gcc-arm-none-eabi-10.3-2021.10/bin"

    Dir["#{toolchain_path}/*"].each do |tool|
      next unless File.executable?(tool)

      toolname = File.basename(tool)
      (bin/toolname).write_env_script tool, PATH: "#{toolchain_path}:$PATH"
    end
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/lumos --version")
  end
end
