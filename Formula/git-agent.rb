class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-darwin-arm64.tar.gz"
      sha256 "0eaacf9cb262df126f85e2056b0044cf0b950770464d300982e58694ca288b8c"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-darwin-amd64.tar.gz"
      sha256 "deae76de5477dccaf4d6bb24de3e050e2bb8ae6b0fedf2694937cd8d06cb56e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-linux-arm64.tar.gz"
      sha256 "c37742e9112ee3dabfd710bce27c489106b59d22226c1aeec27b465beed25580"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-linux-amd64.tar.gz"
      sha256 "3838c190847afac7912f72a79da95ce44372ce4cb2516e48ac69a42a1309d914"
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
