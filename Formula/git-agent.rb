class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-darwin-arm64.tar.gz"
      sha256 "cca758daa553a7738374470e1c4be3e20b4c74a695880048f403fa1bf84e5d79"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-darwin-amd64.tar.gz"
      sha256 "282339ed6350397b8371f300e1233527c691740d31ce959a12680f103ae82429"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-linux-arm64.tar.gz"
      sha256 "8636a05209d9398b89262c6ec84fe1c9dc97289f8208240be9d8d46498fafda8"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.1.0/git-agent-linux-amd64.tar.gz"
      sha256 "ee1e816cf4c7d5035b15a2ac78889c1dc3aeb6921d3b2c26da5fe191c6d36cd9"
    end
  end

  def install
    bin.install "git-agent"
  end

  test do
    system "#{bin}/git-agent", "--help"
  end
end
