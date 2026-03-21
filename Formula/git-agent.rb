class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-darwin-arm64.tar.gz"
      sha256 "ed19a4516a0399da77dc0654ee3c6b7f8dd777a498e969c1cff7a2205c400862"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-darwin-amd64.tar.gz"
      sha256 "ca3338312d1f6b774faf59cd0b8d01a82f37d69235f88252878c4ecf1c224525"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-linux-arm64.tar.gz"
      sha256 "45a605b8a646e18772426f5403bc59a035797a113a68170cac7a722098becd28"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-linux-amd64.tar.gz"
      sha256 "33a2d50724557d1438b79c056a83dd2da863b9e522abfcd66a405417acd22bd9"
    end
  end

  def install
    bin.install "git-agent"
  end

  test do
    system "#{bin}/git-agent", "--help"
  end
end
