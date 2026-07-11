class ClaudeCodeStatusline < Formula
  desc "Fast, config-driven statusline for Claude Code"
  homepage "https://github.com/timrcase/claude-code-statusline"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-darwin-arm64.tar.gz"
      sha256 "fecba8bf9d404f1e1272571b7352ce8921d4796226579268302fede84b922771"
    end
    on_intel do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-darwin-amd64.tar.gz"
      sha256 "e8836bf1eb17ee380982bff6280cb623db629001084170a9c7d2928b2baadb97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-linux-arm64.tar.gz"
      sha256 "885d89b978be98ee020ccaf2e0d9c1cbcda3901e720d1b76de79b62558a1a087"
    end
    on_intel do
      url "https://github.com/timrcase/claude-code-statusline/releases/download/v#{version}/claude-code-statusline-linux-amd64.tar.gz"
      sha256 "7b7f9e4c39796426ed8e151e1e2915aa136ff06794ece66460bdade48fc635fe"
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
