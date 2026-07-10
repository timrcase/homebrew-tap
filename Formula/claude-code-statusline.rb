class ClaudeCodeStatusline < Formula
  desc "Fast, config-driven statusline for Claude Code"
  homepage "https://github.com/timrcase/claude-code-statusline"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-darwin-arm64.tar.gz"
      sha256 "4b53fe375ff49a31b1884f9ba9289e52bd19039e18c9649bd6eef15e0c87f443"
    end
    on_intel do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-darwin-amd64.tar.gz"
      sha256 "f1051e7f0297f1dfe38cf24d1c3eb322f035fc96c4e1c39254156d8d2e83501c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-linux-arm64.tar.gz"
      sha256 "7b0bfe5e16991741b2547a5ea0a0a655c1d8d4c035867109d20558c036173982"
    end
    on_intel do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-linux-amd64.tar.gz"
      sha256 "fc7eb34dadf3d693a3fd38ca1264a6369227284a07caad5eb7bfa3b788274024"
    end
  end

  def install
    bin.install "claude-code-statusline"
  end

  def caveats
    <<~EOS
      To enable the statusline in Claude Code, add this to ~/.claude/settings.json:

          "statusLine": {
            "type": "command",
            "command": "#{HOMEBREW_PREFIX}/bin/claude-code-statusline"
          }

      Then restart Claude Code (or start a new session).
    EOS
  end

  test do
    # Empty stdin prints "Claude" (see main.go).
    assert_equal "Claude", shell_output("#{bin}/claude-code-statusline < /dev/null").strip
  end
end
