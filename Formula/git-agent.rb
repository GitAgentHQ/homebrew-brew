class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.7.0/git-agent-darwin-arm64.tar.gz"
      sha256 "baab817bd2ebafe49a9c5c04a5796edc21e8006c5d932ef5e46ece90719d7abc"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.7.0/git-agent-darwin-amd64.tar.gz"
      sha256 "cd277df7151282f6757d37f2606bd4434df25b69d70988dcdc0871f21b73b92a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.7.0/git-agent-linux-arm64.tar.gz"
      sha256 "84267f18d80d63c1deded74b7a25961e5bc8867ab1953141f4d5096960d93148"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.7.0/git-agent-linux-amd64.tar.gz"
      sha256 "0e546dd8c3a37d88a8822aba004febb0b5e0e50ce26ca1218d2bc312c8c77a3e"
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
