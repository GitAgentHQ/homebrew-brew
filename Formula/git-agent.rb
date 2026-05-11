class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.3.0/git-agent-darwin-arm64.tar.gz"
      sha256 "a6c53026f3080e365eef41ff5d3aebd9dc7e0deaf8bf68afa9c493447bff4e29"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.3.0/git-agent-darwin-amd64.tar.gz"
      sha256 "1eff5269a372bd0d26d02f0a6487c124db73fdc5478a941ea0a0072bf756a2fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.3.0/git-agent-linux-arm64.tar.gz"
      sha256 "02647fb90ec1c2c9d56013e30c5979a0b4552ff26506a5b97199fc93095efae6"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.3.0/git-agent-linux-amd64.tar.gz"
      sha256 "e80af9aca139e07b5276e65ab80e3764eca0eecde454d84c31d898c813e2d004"
    end
  end

  def install
    bin.install "git-agent"
    generate_completions_from_executable(bin/"git-agent", "completion")
  end

  test do
    system "#{bin}/git-agent", "--help"
  end
end
