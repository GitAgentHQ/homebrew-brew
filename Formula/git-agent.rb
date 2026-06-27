class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.6.0/git-agent-darwin-arm64.tar.gz"
      sha256 "304869c188a1bc52fe05b5778af5af8678d6a5cecb1e26e40976f5b64a14ce2e"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.6.0/git-agent-darwin-amd64.tar.gz"
      sha256 "cc777533ccdc15ef3491842047803630c8abcf1b381e4d932d87886389299bb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.6.0/git-agent-linux-arm64.tar.gz"
      sha256 "cbd9fabd031c7a73c932e00de6f7fc34eace24825c9540acd67206adc3795fcd"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.6.0/git-agent-linux-amd64.tar.gz"
      sha256 "9dbc7f2c4a6c465f44e83c456803bdd9d64dcb609679a47979912191e468326a"
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
