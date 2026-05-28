class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.4.0/git-agent-darwin-arm64.tar.gz"
      sha256 "1c5dffd3fc8802182f4c4255f8da1ff366606b9ed1ec996b6440b5297c098e80"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.4.0/git-agent-darwin-amd64.tar.gz"
      sha256 "f448f5aa11a5c6636f663758240183fba34e59ec2f69714358af2d22741c632a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.4.0/git-agent-linux-arm64.tar.gz"
      sha256 "7eed842deacbe10bfcd7ab3e7fbdcf8ff4fa85814a101ea18ebc162be586bb5e"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.4.0/git-agent-linux-amd64.tar.gz"
      sha256 "560e44eb9f3ecb965a32719688bd55459e0117f15a988465df33e4b81875d9b6"
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
