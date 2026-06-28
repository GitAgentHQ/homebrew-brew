class GitAgent < Formula
  desc "AI-powered git commit agent"
  homepage "https://github.com/GitAgentHQ/git-agent-cli"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.6.1/git-agent-darwin-arm64.tar.gz"
      sha256 "c4193bf169e094cc456655df329e7dec54a939b7b63be626b2beae54497bb1ec"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.6.1/git-agent-darwin-amd64.tar.gz"
      sha256 "cad3e54dee68e080748d85b94fef3e9e3b62e9dc2807f8032a5ad02296530afd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.6.1/git-agent-linux-arm64.tar.gz"
      sha256 "87007f30149b141724f8886ad0237b07a81621877e54992afee71991bca6b577"
    else
      url "https://github.com/GitAgentHQ/git-agent-cli/releases/download/v0.6.1/git-agent-linux-amd64.tar.gz"
      sha256 "b93b851353b3c842ddc8d506098b95c7684b838928e9e5d515ccf3dac790e72c"
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
