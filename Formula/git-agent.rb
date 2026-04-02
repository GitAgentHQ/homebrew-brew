class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.2.0/git-agent-darwin-arm64.tar.gz"
      sha256 "92b459208f4578c050dff5b2a6bdcbc46a67a261f66eebc950a0d70ee35850a5"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.2.0/git-agent-darwin-amd64.tar.gz"
      sha256 "cb4f58975eac61310ed0e8a30cce4f18d254e24c6ef769f2010856ff6d1d31b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.2.0/git-agent-linux-arm64.tar.gz"
      sha256 "c2ffe1a702ecb3a0fb8ac4fe9e1b50af04c9cc66efb7d5f488e26607599a4c73"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.2.0/git-agent-linux-amd64.tar.gz"
      sha256 "0d7a4d5052bb902e37b502ef708bc45d38440b52a45c29745f1b147b7d383cfb"
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
