class Up9 < Formula
  desc "Everything you need to get started with up9"
  homepage "https://docs.up9.com"
  url "https://up9cli.s3.amazonaws.com/up9-darwin-x64.tar.gz"
  sha256 "903f30e36d5c628ac6efc9a991094ef7bf2a8c49727ed132054a23019a3f509f"

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
