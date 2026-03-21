class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-darwin-arm64.tar.gz"
      sha256 "82aaec7d3fbedf5da5d152483a4fd4c9a9a091537e4b75b64b476956240ab140"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-darwin-amd64.tar.gz"
      sha256 "03aa7189f26d94efbee4ba2134eaaec27dd78b7e5a857a8af550721e3b477a8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-linux-arm64.tar.gz"
      sha256 "a9ef58c26f44100339c871c95eaf9f5d12e19eeae45e23a0a454fc7099657b9a"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-linux-amd64.tar.gz"
      sha256 "ef4760efd899a8d727e45ccbe7fb24b1dfef4eb278af369960bed4f0147e2b7a"
    end
  end

  def install
    bin.install "git-agent"
  end

  test do
    system "#{bin}/git-agent", "--help"
  end
end
