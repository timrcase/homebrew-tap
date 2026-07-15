class ClaudeCodeStatusline < Formula
  desc "Fast, config-driven statusline for Claude Code"
  homepage "https://github.com/timrcase/claude-code-statusline"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-darwin-arm64.tar.gz"
      sha256 "43e6b6c88ba2a86fe44e4caa40e8eae590edfe0f21fe91c8197fa6412cbc693e"
    end
    on_intel do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-darwin-amd64.tar.gz"
      sha256 "fd9a80437be9133a9dc464f9c4b2cc77d17fc181de3b38619689e73bee1fdf18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-linux-arm64.tar.gz"
      sha256 "300977691a3d51845431c6dec3e3976e900d140089e885acbcf2bd0d217ed75c"
    end
    on_intel do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-linux-amd64.tar.gz"
      sha256 "a497aeef7c5f84174d44d104fa24a1f633d19f0cb1b38ecea0edcfb445c02777"
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
