class Up9DarwinX < Formula
  desc "Everything you need to get started with up9"
  homepage "https://docs.up9.com"
  url "https://up9cli.s3.amazonaws.com/up9-darwin-x64.tar.gz"
  sha256 "b48987ee16c8eda8c2cd500a1b9c662224bc9351e0a0a348847002a498b2bbf1"

  def install
    inreplace "bin/up9", /^CLIENT_HOME=/, "export UP9_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/up9"

    # bash_completion.install "#{libexec}/node_modules/@heroku-cli/plugin-autocomplete/autocomplete/brew/bash"
    # zsh_completion.install "#{libexec}/node_modules/@heroku-cli/plugin-autocomplete/autocomplete/brew/zsh/_heroku"
  end

  test do
    system bin/"up9", "version"
  end
end
