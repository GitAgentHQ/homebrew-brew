class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.0.0/git-agent-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.0.0/git-agent-darwin-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.0.0/git-agent-linux-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.0.0/git-agent-linux-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "git-agent"
  end

  test do
    system "#{bin}/git-agent", "--help"
  end
end
