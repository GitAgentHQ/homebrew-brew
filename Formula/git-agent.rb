class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.5.2/git-agent-darwin-arm64.tar.gz"
      sha256 "1ed2444120c90e92a8c9d04505da093a5e9ff06ceb2cd39c1c2589b779155c71"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.5.2/git-agent-darwin-amd64.tar.gz"
      sha256 "4099dae0e3f3f02fb7769b79f9453096bb79d5c395ffae3dfac097831c4778d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.5.2/git-agent-linux-arm64.tar.gz"
      sha256 "50291800a943220fce455675e617f459632f56edba0788bef333be7fda3e54e3"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.5.2/git-agent-linux-amd64.tar.gz"
      sha256 "6a3d303760f7a355630acb0869b87cf99bf543e36ea26e28fe72197f1aa3dd21"
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
