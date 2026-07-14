class ClaudeCodeStatusline < Formula
  desc "Fast, config-driven statusline for Claude Code"
  homepage "https://github.com/timrcase/claude-code-statusline"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-darwin-arm64.tar.gz"
      sha256 "9531a0d65d6dced7d7a10e13d3087fccd14a1d4e3df45fdfa773e42122ba8ef7"
    end
    on_intel do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-darwin-amd64.tar.gz"
      sha256 "f532bb853b6ea863374a491dc89054032cdc4831cb39a9057f3b79a6992798b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-linux-arm64.tar.gz"
      sha256 "544299c09c0b1d2cf1741d693911df654ef16043f96758723d6572c047658d3d"
    end
    on_intel do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-linux-amd64.tar.gz"
      sha256 "5ed115ec7f322dcd5ef128f6aa9ad26ac9e1168f451df1b8042eb7d952db1250"
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
