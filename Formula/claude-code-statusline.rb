class ClaudeCodeStatusline < Formula
  desc "Fast, config-driven statusline for Claude Code"
  homepage "https://github.com/timrcase/claude-code-statusline"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-darwin-arm64.tar.gz"
      sha256 "863c52002b830f3914e008206ea81cfcf7d02652b280a290b119396bf26965f6"
    end
    on_intel do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-darwin-amd64.tar.gz"
      sha256 "72e53b40e18acf80391ef9819a721efb7afeb1504e1065099650fdaa9ffa3cb7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-linux-arm64.tar.gz"
      sha256 "c5e1c6699906daf53d339268c431245c20cd516fbca291dd7bf8d3a1861b920b"
    end
    on_intel do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-linux-amd64.tar.gz"
      sha256 "cb2351fcc53c59c1c03da575a34afe563f63812ff51415fdebaacb70af59bf05"
    end
  end

  def install
    bin.install "claude-code-statusline"
  end

  test do
    # Empty stdin prints "Claude" (see main.go).
    assert_equal "Claude", shell_output("#{bin}/claude-code-statusline < /dev/null").strip
  end
end
