class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.5.1/git-agent-darwin-arm64.tar.gz"
      sha256 "4a742c9abeb499bc381251b460503821356d9db52d91414941b250b79389fa9a"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.5.1/git-agent-darwin-amd64.tar.gz"
      sha256 "f5f1b9efa6d07a56cdce6ef9d2ba9a2801d6297144688f6c52be5a8a111ee1ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.5.1/git-agent-linux-arm64.tar.gz"
      sha256 "a8ef939a8aeb433a1b99c6980a4276305faab0c49da91b4765b4cbab615f01a9"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.5.1/git-agent-linux-amd64.tar.gz"
      sha256 "4a0ab12c54f4dc3a650964bcb0ae9b23e4d088defdcde03e440a61d03e5770d0"
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
