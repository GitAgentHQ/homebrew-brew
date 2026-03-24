class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-darwin-arm64.tar.gz"
      sha256 "c216b600b8fccb32579576f97c8cb2c5c4034d537890577917c71ea84b3878e8"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-darwin-amd64.tar.gz"
      sha256 "ca02ba6dd142c4d6ef4dc46f6e1088588821dff2e8b48ff4c42aac480a974d9f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-linux-arm64.tar.gz"
      sha256 "00a3712b32a7ce86d9403832d90e03db9aa976f9e7bd0da6d6e25c99885f0333"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-linux-amd64.tar.gz"
      sha256 "6d24916e25d7160338a07d722f34096f3f95de0dbcdabbbcfe7fd023fefbc7cc"
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
