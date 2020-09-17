class Up9 < Formula
  desc "Everything you need to get started with up9"
  homepage "https://docs.up9.com"
  url "https://up9cli.s3.amazonaws.com/up9-darwin-x64.tar.gz"
  sha256 "dbd90baae17efe856e1b8b93df694aa2d2421de364b074b3f3a97d193f90dae5"

  def install
    inreplace "bin/up9", /^CLIENT_HOME=/, "export UP9_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/up9"
  end

  def caveats; <<~EOS
    To use the UP9 CLI, run --
      $ up9 auth:login
  EOS
  end

  test do
    system bin/"up9", "version"
  end
end
